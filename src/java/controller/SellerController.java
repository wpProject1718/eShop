package controller;

import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class SellerController {

    ModelAndView mv = new ModelAndView();

    @RequestMapping(value = "/seller")
    public ModelAndView adminPage(HttpServletRequest request) {
        mv.setViewName("home");
        if (request.getSession().getAttribute("type") != null) {
            int type = (int) request.getSession().getAttribute("type");
            if (type == 2) {
                mv.setViewName("seller_page");
            }
        }
        return mv;
    }

    @RequestMapping(value = "/seller_modify")
    public ModelAndView modify(HttpServletRequest request
    ) {
        mv.setViewName("home");
        if (request.getSession().getAttribute("type") != null) {
            int type = (int) request.getSession().getAttribute("type");
            if (type == 2) {
                mv.setViewName("seller_modify");
            }
        }
        return mv;
    }

    @RequestMapping(value = "/seller_category")
    public ModelAndView modifyCategory(HttpServletRequest request
    ) {
        mv.setViewName("home");
        if (request.getSession().getAttribute("type") != null) {
            int type = (int) request.getSession().getAttribute("type");
            if (type == 2) {
                mv.setViewName("seller_category");
            }
        }
        return mv;
    }

    @RequestMapping(value = "/seller_product")
    public ModelAndView modifyProduct(HttpServletRequest request
    ) {
        mv.setViewName("home");
        if (request.getSession().getAttribute("type") != null) {
            int type = (int) request.getSession().getAttribute("type");
            if (type == 2) {
                mv.setViewName("seller_product");
            }
        }
        return mv;
    }
}
