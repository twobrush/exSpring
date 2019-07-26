package kr.ac.hit.myapp.member;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MemberController {
//	@Autowired @Inject @Resource 중 하나를 사용하여 자동 주입
	@Resource
	private MemberService memberService;

	@RequestMapping(value = "/member/add.do", method = RequestMethod.GET)
	public String addForm() {
		return "member/memAdd";
		// "WEB-INF/views/->????.jsp"
	}

	@RequestMapping(value = "/member/add.do", method = RequestMethod.POST)
	public String add(MemberVo vo) {
		memberService.insert(vo);
		// 파라미터로 넘어온 값을 받아서 데이터베이스에 추가(insert)
//JSP파일로 이동하는 대신redirect: 뒤에 지정한 주소로 이동하라는 응답을 전송
		return "redirect:/member/list.do";
	}
	
	@RequestMapping("/member/list.do")
	public String list(Map modelMap) {
		//데이터베이스에서 회원목록을 조회,
		List<MemberVo> list = memberService.selectList();
		//조회한 회원목록을 list를 JSP에서 ${memberList} 로 사용할수 있도록 모델에 저장
		modelMap.put("memberList",list);
		return "member/memList";
	}
	
	
	@RequestMapping(value = "/member/edit.do", method = RequestMethod.GET)
	public String editForm(String memId ,Map modelMap) {
		MemberVo vo = memberService.select(memId);
		modelMap.put("memberVo",vo);
		return "member/memEdit";
	}
	
	@RequestMapping(value = "/member/edit.do", method = RequestMethod.POST)
	public String edit( MemberVo vo) {
		int num = memberService.update(vo);
		return "redirect:/member/list.do";
	}
	
	@RequestMapping(value = "/member/del.do")
	public String del(String memId) {
		int num = memberService.delete(memId);
		return "redirect:/member/list.do";
	}
	
	
	
	

}
