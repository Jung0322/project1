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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.company.domain.ChatMessage;
import com.company.domain.ChatRoom;
import com.company.domain.MemberDTO;
import com.company.handler.ChatSession;
import com.company.service.ChatService;
import com.company.service.ChatServiceImpl;
import com.company.service.MemberService;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;
 
 
@Controller
public class ChatController {
    @Autowired
    private ChatServiceImpl cService;
    
    @Autowired
    private MemberService mService;
    
    @RequestMapping(value = "/view_chat")
    public String viewChat(Principal principal, Model model) {
    	
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
    
    /**
     * 채팅 방이 없을 때 생성
     * @param room
     * @param userEmail
     * @param masterNickname
     * @return
     */
    @ResponseBody
    @RequestMapping("createChat.do")
    public String createChat(ChatRoom room, String userId, String usernickname, String masternickname){
        
        MemberDTO m = mService.readMemberInfo(masternickname); // 상대방 닉네임으로 member service에서 데이터 가져오기 
        
        // 채팅방DTO에 값 저장 
        room.setUserid(userId);
        room.setUsernickname(usernickname);
        room.setMasterid(m.getUserid());
        room.setMasternickname(m.getNickname());
        room.setMasterpic(m.getUserid());
 
        ChatRoom exist  = cService.searchChatRoom(room);
        
        // DB에 방이 없을 때
        if(exist == null) {
            System.out.println("방이 없다!!");
            int result = cService.createChat(room);
            if(result == 1) {
                System.out.println("방 만들었다!!");
                return "new";
            }else {
                return "fail";
            }
        }
        // DB에 방이 있을 때
        else{
            System.out.println("방이 있다!!");
            return "exist";
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