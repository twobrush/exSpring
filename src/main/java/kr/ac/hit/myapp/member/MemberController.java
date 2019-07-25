package kr.ac.hit.myapp.member;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MemberController {

	@RequestMapping(value="/member/add.do",method=RequestMethod.GET)
	public String addForm() {
		return "member/memAdd";
//		"WEB-INF/views/->????.jsp"
	}
	
	@RequestMapping(value="/member/add.do",method=RequestMethod.POST)
	public String add(MemberVo vo) {
		//파라미터로 넘어온 값을 받아서 데이터베이스에 추가(insert)
		
		
		
		System.out.println(vo.getMemId());
		System.out.println(vo.getMemPass());
		System.out.println(vo.getMemName());
		System.out.println(vo.getMemPoint());
		
		return "member/memAdd";
	}
	
}
