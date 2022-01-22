package com.company.cotroller;

import java.io.IOException;
import java.security.Principal;
import java.util.ArrayList;
import java.util.List;
 
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.company.domain.ChatMessage;
import com.company.domain.ChatRoom;
import com.company.domain.MemberAttachDTO;
import com.company.domain.MemberDTO;
import com.company.domain.ProductDTO;
import com.company.handler.ChatSession;
import com.company.service.ChatService;
import com.company.service.ChatServiceImpl;
import com.company.service.MemberService;
import com.company.service.ProductService;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;
 
 
@Controller
public class ChatController {
    @Autowired
    private ChatServiceImpl cService;
    
    @Autowired
    private MemberService mService;
    
    @Autowired
    private ProductService pService;
    
    @RequestMapping(value = "/view_chat", method = RequestMethod.GET)
    public String viewChat(Principal principal, Model model) {
    	
    	System.out.println("!!!!!");
    	
    	System.out.println(principal.getName());
    	
    	if(principal.getName()!= null) {
    		model.addAttribute("loginMember", mService.readMemberInfo(principal.getName()));
    		
    		return "/chatting/view_chat";
    	}
    	else 
    		return "/product/index";
    }

    /**
     * 해당 채팅방의 채팅 메세지 불러오기
     * @param roomId
     * @param model
     * @param response
     * @throws JsonIOException
     * @throws IOException
     */
    @RequestMapping(value="{roomid}.do")
    public void messageList(@PathVariable String roomid, String userid, Model model, HttpServletResponse response) throws /*JsonIOException,*/ IOException {
        List<ChatMessage> mList = cService.messageList(roomid);
        response.setContentType("application/json; charset=utf-8");
        
        // 안읽은 메세지의 숫자 0으로 바뀌기
        ChatMessage message = new ChatMessage();
        message.setSentid(userid);
        message.setRoomid(roomid);
        cService.updateCount(message);
        
        Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
        gson.toJson(mList,response.getWriter());
    }
    
    @ResponseBody
    @RequestMapping(value="{chat_delete_roomid}_delete.do")
    public String chatDelete(@PathVariable String chat_delete_roomid, HttpServletResponse response) throws /*JsonIOException,*/ IOException {
    	System.out.println("가져온 방:::::::"+chat_delete_roomid);
    	int chatDelete = cService.chatroomDelete(chat_delete_roomid);
    	System.out.println(chatDelete==1 ? "채팅방이 삭제되었습니다." : "삭제 실패");
    	String suc;
    	if(chatDelete ==1) {
    		 suc = "success";
    	}else {
    		suc = "fail";
    	}
    	return suc;
    }
    /**
     * 채팅 방이 없을 때 생성
     * @param room
     * @param userEmail
     * @param masterNickname
     * @return
     */
    @ResponseBody
    @RequestMapping("createChat.do")
    public String createChat(ChatRoom room, String userid, int  pno, Model model){
        
    	// 상품번호로 등록한 판매자의 아이디/닉네임 가져오기 
    	System.out.println("상품번호 :::"+pno);
        ProductDTO p = pService.getRow(pno);
        MemberDTO m =  mService.readMemberInfo(p.getUserid());
        System.out.println("로그인한 아이디 :::::"+userid+"상품 판매하는 아이디:::"+m.getUserid());
        // 자신과 대화하려고 할때 
        System.out.println(userid.equals(m.getUserid()));
       
        if(userid.equals(m.getUserid())) {
        	return "nochat";
        }
        
        // 채팅방DTO에 값 저장 
        room.setUserid(userid);
        room.setUsernickname(mService.readMemberInfo(userid).getNickname());
        room.setMasterid(m.getUserid());
        room.setMasternickname(m.getNickname());
 
        ChatRoom exist  = cService.searchChatRoom(room);
        
        // DB에 방이 없을 때
        if(exist == null) {
            System.out.println("방이 없다!!");
            int result = cService.createChat(room);
            if(result == 1) {
                System.out.println("방 만들었다!!");
                String room_id =cService.searchChatRoom(room).getRoomid(); 
                return room_id;
            }else {
                return "failRoom";
            }
        }
        // DB에 방이 있을 때
        else{
            System.out.println("방이 있다!!");
            String room_id =cService.searchChatRoom(room).getRoomid(); 
            return room_id;
        }
    }
    
    /**
     * 채팅 방 목록 불러오기
     * @param room
     * @param userEmail
     * @param response
     * @throws JsonIOException
     * @throws IOException
     */
    @RequestMapping("chatRoomList.do")
    public void createChat(ChatMessage message, String userid, HttpServletResponse response) throws JsonIOException, IOException{
        System.out.println("로그인한 아이디 불러줘 ::"+userid);
    	List<ChatRoom> cList = cService.chatRoomList(userid);
        
        for(int i = 0; i < cList.size(); i++) {
            message.setRoomid(cList.get(i).getRoomid());
            message.setSentid(userid);
            int count = cService.selectUnReadCount(message);
            cList.get(i).setUnReadCount(count);
        }
        
        response.setContentType("application/json; charset=utf-8");
 
        Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
        gson.toJson(cList,response.getWriter());
    }
    
    
    @RequestMapping("chatSession.do")
    public void chatSession(HttpServletResponse response, Principal principal) throws /*JsonIOException,*/ IOException{
        principal.getName();
        ArrayList<String> chatSessionList = ChatSession.getLoginUser(); // 현재 로그인된 유저들을 불러서 저장
        
        response.setContentType("application/json; charset=utf-8");
 
        Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
        gson.toJson(chatSessionList,response.getWriter());
    }
    
}