package com.ict.runningON.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ict.runningON.service.LikesService;
import com.ict.runningON.service.LoginService;
import com.ict.runningON.service.MypageService;
import com.ict.runningON.service.PostsService;
import com.ict.runningON.vo.CommentsVO;
import com.ict.runningON.vo.DislikesVO;
import com.ict.runningON.vo.LikesVO;
import com.ict.runningON.vo.PostsVO;
import com.ict.runningON.vo.ReportVO;
import com.ict.runningON.vo.ScrapsVO;
import com.ict.runningON.vo.UsersVO;

@Controller
public class PostsController {
	
	/* 조성주 */
	@Autowired
	private PostsService postsService;
	@Autowired
	private LikesService likesService;
	@Autowired
	private LoginService loginService;
	@Autowired
	private MypageService mypageService;
	// 게시글 작성 페이지
	@GetMapping("/write")
	public ModelAndView boardwrite() {
		ModelAndView mv = new ModelAndView("posts/write");		
		return mv;
	}
	
	// 게시글 내용 페이지
	@GetMapping("/detail")
	public ModelAndView getDetail(@RequestParam("post_idx") String post_idx, @ModelAttribute("cPage") String cPage, HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		ModelAndView mv = new ModelAndView("posts/detail");
		
		Cookie[] cookies = request.getCookies();
		boolean todayView = false;
		
		if(cookies != null) {
			for (Cookie cookie : cookies) {
				// 쿠키이름이 해당 게시글의 ID와 일치할 경우 조회한 것으로 간주
				if(cookie.getName().equals("viewed_"+ post_idx)) {
					todayView = true;
					break;
				}
			}
		}
		
		// 조회수 증가
		if (!todayView) {
			int result = postsService.getPostsViewUpdate(post_idx);
			Cookie viewCookie = new Cookie("viewed_"+post_idx, "true");
			viewCookie.setMaxAge(24*60*60);
			response.addCookie(viewCookie);
		}
		
		// 상세보기
		PostsVO pvo = postsService.getPostsDetail(post_idx);	
		// 댓글 리스트 불러오기
		List<CommentsVO> clist = postsService.getCommentList(post_idx);
		 // 각 댓글에 좋아요 수를 추가
	    for (CommentsVO comment : clist) {
	        int likeCount = likesService.commentCountLike(comment.getComment_idx());
	        comment.setLikeCount(likeCount);
	    }
	    // 게시글 내용에 로그인 정보 넣기
	    String user_id = pvo.getUser_id();
	    UsersVO uservo = mypageService.getMyInfo(user_id);
	    if(session.getAttribute("uvo") != null) {
	    	UsersVO uvo = (UsersVO) session.getAttribute("uvo");
	    	uservo.setUser_id(uvo.getUser_id());
	    }
	    mv.addObject("uvo", uservo);
		mv.addObject("pvo", pvo);
		mv.addObject("clist", clist);
		return mv;
	}
	@PostMapping("/write_ok") 
	public ModelAndView boardwriteok(PostsVO pvo, HttpServletRequest request, HttpSession session) {
		try {
			ModelAndView mv = new ModelAndView("redirect:/board?board_idx="+pvo.getBoard_idx());
			 // 세션에서 로그인 정보 가져오기
	        UsersVO uvo = (UsersVO) session.getAttribute("uvo");
	        
	        // 로그인 정보가 없을 경우
	        if (uvo == null) {
	            // 로그인 페이지로 리다이렉트
	            mv.setViewName("redirect:/loginForm");
	            return mv;
	        }
	        
	        // 로그인한 사용자의 ID 출력 (디버깅용)
	        System.out.println("로그인한 사용자 ID: " + uvo.getUser_id());
	        
	        // 게시글 작성 처리
	        pvo.setUser_id(uvo.getUser_id()); // 게시글에 로그인한 사용자 ID 설정
			int result = postsService.getPostsInsert(pvo);
			if(result>0) {
				return mv;
			}
			return new ModelAndView("posts/error");
		} catch (Exception e) {
			System.out.println(e);
			return new ModelAndView("posts/error");
		}
	}
	@PostMapping("/update")
	public ModelAndView detailUpdate(@ModelAttribute("post_idx") String post_idx, @ModelAttribute("cPage") String cPage) {
		ModelAndView mv = new ModelAndView("posts/update");
		// DB 에서 b_idx를 이용해서 정보 가져오기
		PostsVO pvo = postsService.getPostsDetail(post_idx);
		if (pvo != null) {
			mv.addObject("pvo", pvo);
			return mv;
		}
		return null;
	}
	@PostMapping("/update_ok") 
	public ModelAndView boardupdateok(PostsVO pvo, HttpServletRequest request, HttpSession session,@ModelAttribute("cPage") String cPage,
			@ModelAttribute("post_idx") String post_idx) {
		try {
			ModelAndView mv = new ModelAndView("redirect:/board?board_idx="+pvo.getBoard_idx());
			 // 세션에서 로그인 정보 가져오기
	        UsersVO uvo = (UsersVO) session.getAttribute("uvo");
	        
	        // 로그인 정보가 없을 경우
	        if (uvo == null) {
	            // 로그인 페이지로 리다이렉트
	            mv.setViewName("redirect:/loginForm");
	            return mv;
	        }
	        
	        // 로그인한 사용자의 ID 출력 (디버깅용)
	        System.out.println("로그인한 사용자 ID: " + uvo.getUser_id());
	        
	        // 게시글 작성 처리
	        pvo.setUser_id(uvo.getUser_id()); // 게시글에 로그인한 사용자 ID 설정
			int result = postsService.getPostsUpdate(pvo);
			if(result>0) {
				return mv;
			}
			return new ModelAndView("posts/error");
		} catch (Exception e) {
			System.out.println(e);
			return new ModelAndView("posts/error");
		}
	}
	@PostMapping("/delete")
	public ModelAndView deletePost(@RequestParam("board_idx") String board_idx, @ModelAttribute("cPage") String cPage,
			@ModelAttribute("post_idx") String post_idx ) {
		ModelAndView mv= new ModelAndView("redirect:/board?board_idx="+board_idx);
		int result = postsService.getPostsDelete(post_idx);
		return mv;
	}
	@PostMapping("/comment_insert")
	public ModelAndView getCommentInsert(CommentsVO cvo, @ModelAttribute("post_idx") String post_idx, @ModelAttribute("cPage") String cPage, HttpSession session) {
		ModelAndView mv = new ModelAndView("redirect:/detail");
		 // 세션에서 로그인 정보 가져오기
        UsersVO uvo = (UsersVO) session.getAttribute("uvo");
        
        // 로그인 정보가 없을 경우
        if (uvo == null) {
            // 로그인 페이지로 리다이렉트
            mv.setViewName("redirect:/loginForm");
            return mv;
        }
        
        // 로그인한 사용자의 ID 출력 (디버깅용)
        System.out.println("로그인한 사용자 ID: " + uvo.getUser_id());
        
        // 게시글 작성 처리
        cvo.setUser_id(uvo.getUser_id()); // 게시글에 로그인한 사용자 ID 설정
		int result = postsService.getCommentInsert(cvo);
		return mv;
	}
	@PostMapping("/comment_delete")
	public ModelAndView getCommentDelete(@RequestParam("comment_idx") String comment_idx, @ModelAttribute("post_idx") String post_idx,
			@ModelAttribute("cPage") String cPage) {
		ModelAndView mv = new ModelAndView("redirect:/detail");
		int result = postsService.getCommentDelete(comment_idx);
		return mv;
	}
	@PostMapping("/comment_like")
	public ModelAndView likeComment(@RequestParam("comment_idx") String comment_idx, LikesVO lvo, @ModelAttribute("post_idx") String post_idx,
			@ModelAttribute("cPage") String cPage, HttpSession session) {
		ModelAndView mv = new ModelAndView("redirect/detail"); 
		 // 세션에서 로그인 정보 가져오기
        UsersVO uvo = (UsersVO) session.getAttribute("uvo");
        
        // 로그인 정보가 없을 경우
        if (uvo == null) {
            // 로그인 페이지로 리다이렉트
            mv.setViewName("redirect:/loginForm");
            return mv;
        }
        
        // 로그인한 사용자의 ID 출력 (디버깅용)
        System.out.println("로그인한 사용자 ID: " + uvo.getUser_id());
        
        // 게시글 작성 처리
        lvo.setUser_id(uvo.getUser_id()); // 게시글에 로그인한 사용자 ID 설정
		mv.addObject("delayedRedirect", "/detail?post_idx=" + post_idx);
		int result = likesService.commentCheckLike(lvo);
		if(result>0) {
			int deleteClike = likesService.commentDeleteLike(lvo);
		}else {
			int addClike = likesService.commentAddLike(lvo);
		}
		return mv;
	}
	@PostMapping("/comment_report")
	public ModelAndView reportComment(@RequestParam("comment_idx") String comment_idx, ReportVO rvo,@ModelAttribute("cPage") String cPage, HttpSession session) {
		ModelAndView mv = new ModelAndView("redirect/detail");
		// 세션에서 로그인 정보 가져오기
		UsersVO uvo = (UsersVO) session.getAttribute("uvo");
		
		// 로그인 정보가 없을 경우
		if (uvo == null) {
			// 로그인 페이지로 리다이렉트
			mv.setViewName("redirect:/loginForm");
			return mv;
		}
		
		// 로그인한 사용자의 ID 출력 (디버깅용)
		System.out.println("로그인한 사용자 ID: " + uvo.getUser_id());
		
		// 게시글 작성 처리
		rvo.setUser_id(uvo.getUser_id()); // 게시글에 로그인한 사용자 ID 설정
		int result = postsService.checkReportComment(rvo);
		if (result>0) {
			
		}else {
			int reportComment = postsService.reportComment(rvo);			
		}
		int updateRepostComment = postsService.updateReportComment(comment_idx);
		return mv;
	}
	@PostMapping("/post_like")
	public ModelAndView likePost(@RequestParam("post_idx") String post_idx, LikesVO lvo,@ModelAttribute("cPage") String cPage, HttpSession session) {
		ModelAndView mv = new ModelAndView("redirect/detail"); 
		 // 세션에서 로그인 정보 가져오기
        UsersVO uvo = (UsersVO) session.getAttribute("uvo");
        
        // 로그인 정보가 없을 경우
        if (uvo == null) {
            // 로그인 페이지로 리다이렉트
            mv.setViewName("redirect:/loginForm");
            return mv;
        }
        
        // 로그인한 사용자의 ID 출력 (디버깅용)
        System.out.println("로그인한 사용자 ID: " + uvo.getUser_id());
        
        // 게시글 작성 처리
        lvo.setUser_id(uvo.getUser_id()); // 게시글에 로그인한 사용자 ID 설정
		mv.addObject("delayedRedirect", "/detail?post_idx=" + post_idx);
		int result = likesService.postCheckLike(lvo);
		if(result>0) {
			int deletePlike = likesService.postDeleteLike(lvo);
		}else {
			int addPlike = likesService.postAddLike(lvo);
		}
		System.out.println("좋아요 업데이트 전");
		int updatePlike = likesService.postUpdateLike(post_idx);
		System.out.println("thread 전");
		try {
			Thread.sleep(1000);
			System.out.println("thread 후");
		} catch (InterruptedException e) {
			System.out.println(e);
		}
		System.out.println("is_hot 전");
		int update_post_is_hot_set = likesService.postUpdatePostIsHotSet();
		int update_post_is_hot_reset = likesService.postUpdatePostIsHotReset();
		System.out.println("is_hot 후");
		return mv;
	}
	@PostMapping("/post_dislike")
	public ModelAndView dislikePost(@RequestParam("post_idx") String post_idx, DislikesVO dlvo,@ModelAttribute("cPage") String cPage, HttpSession session) {
		ModelAndView mv = new ModelAndView("redirect/detail"); 
		 // 세션에서 로그인 정보 가져오기
        UsersVO uvo = (UsersVO) session.getAttribute("uvo");
        
        // 로그인 정보가 없을 경우
        if (uvo == null) {
            // 로그인 페이지로 리다이렉트
            mv.setViewName("redirect:/loginForm");
            return mv;
        }
        
        // 로그인한 사용자의 ID 출력 (디버깅용)
        System.out.println("로그인한 사용자 ID: " + uvo.getUser_id());
        
        // 게시글 작성 처리
        dlvo.setUser_id(uvo.getUser_id()); // 게시글에 로그인한 사용자 ID 설정
		mv.addObject("delayedRedirect", "/detail?post_idx=" + post_idx);
		int result = likesService.postCheckDislike(dlvo);
		if(result>0) {
			int deletePdislike = likesService.postDeleteDislike(dlvo);
		}else {
			int addPdislike = likesService.postAddDislike(dlvo);
		}
		int updatePdislike = likesService.postUpdateDislike(post_idx);
		return mv;
	}
	@PostMapping("/post_scrap")
	public ModelAndView scrapPost(@RequestParam("post_idx") String post_idx, ScrapsVO svo,@ModelAttribute("cPage") String cPage, HttpSession session) {
		ModelAndView mv = new ModelAndView("redirect/detail");
		 // 세션에서 로그인 정보 가져오기
        UsersVO uvo = (UsersVO) session.getAttribute("uvo");
        
        // 로그인 정보가 없을 경우
        if (uvo == null) {
            // 로그인 페이지로 리다이렉트
            mv.setViewName("redirect:/loginForm");
            return mv;
        }
        
        // 로그인한 사용자의 ID 출력 (디버깅용)
        System.out.println("로그인한 사용자 ID: " + uvo.getUser_id());
        
        // 게시글 작성 처리
        svo.setUser_id(uvo.getUser_id()); // 게시글에 로그인한 사용자 ID 설정
		int result = postsService.checkScrapPost(svo);
		if (result>0) {
			int deleteScrapPost = postsService.deleteScrapPost(svo);
		}else {
			int insertScrapPost = postsService.insertScrapPost(svo);
		}
		return mv;
	}
	
	@PostMapping("/post_report")
	public ModelAndView reportPost(@RequestParam("post_idx") String post_idx, ReportVO rvo,@ModelAttribute("cPage") String cPage, HttpSession session) {
		ModelAndView mv = new ModelAndView("redirect/detail");
		 // 세션에서 로그인 정보 가져오기
        UsersVO uvo = (UsersVO) session.getAttribute("uvo");
        
        // 로그인 정보가 없을 경우
        if (uvo == null) {
            // 로그인 페이지로 리다이렉트
            mv.setViewName("redirect:/loginForm");
            return mv;
        }
        
        // 로그인한 사용자의 ID 출력 (디버깅용)
        System.out.println("로그인한 사용자 ID: " + uvo.getUser_id());
        
        // 게시글 작성 처리
        rvo.setUser_id(uvo.getUser_id()); // 게시글에 로그인한 사용자 ID 설정
		int result = postsService.checkReportPost(rvo);
		System.out.println(result);
		if (result>0) {
			
		}else {
			int reportPost = postsService.reportPost(rvo);			
		}
		int updateRepostPost = postsService.updateReportPost(post_idx);
		return mv;
	}
}
