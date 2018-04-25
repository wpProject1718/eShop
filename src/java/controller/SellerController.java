package controller;

import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class SellerController {

    ModelAndView mv = new ModelAndView();

    /*
    @RequestMapping(value = "/seller")
    public ModelAndView adminPage(HttpServletRequest request) {
        mv.setViewName("login");
        if (request.getSession().getAttribute("type") != null) {
            int type = (int) request.getSession().getAttribute("type");
            if (type == 2) {
                mv.setViewName("seller_page");
            }
        }
        return mv;
    }*/
    @RequestMapping(value = "/seller_modify")
    public ModelAndView modify(HttpServletRequest request
    ) {
        mv.setViewName("login");
        if (request.getSession().getAttribute("type") != null) {
            int type = (int) request.getSession().getAttribute("type");
            if (type == 2) {
                mv.setViewName("seller_modify");
            }
        }
        return mv;
    }

    @RequestMapping(value = "/seller_create")
    public ModelAndView createProduct(HttpServletRequest request
    ) {
        mv.setViewName("login");
        if (request.getSession().getAttribute("type") != null) {
            int type = (int) request.getSession().getAttribute("type");
            if (type == 2) {
                mv.setViewName("create_product");
            }
        }
        return mv;
    }

    
    @RequestMapping(value = "/createproduct")
    public ModelAndView createProductsuccess(HttpServletRequest request
    ) {
        mv.setViewName("login");
        if (request.getSession().getAttribute("type") != null) {
            int type = (int) request.getSession().getAttribute("type");
            if (type == 2) {
                mv.addObject("name", request.getParameter("name"));
                mv.addObject("price", request.getParameter("price"));
                mv.addObject("cat", request.getParameter("cat"));
                mv.addObject("num", request.getParameter("num"));
                mv.addObject("img", request.getParameter("img"));
                mv.addObject("info", request.getParameter("info"));
                mv.setViewName("createproductsuccess");
            }
        }
        return mv;
    }
    
    @RequestMapping(value = "/seller_product")
    public ModelAndView modifyProduct(HttpServletRequest request
    ) {
        mv.setViewName("login");
        if (request.getSession().getAttribute("type") != null) {
            int type = (int) request.getSession().getAttribute("type");
            if (type == 2) {
                mv.setViewName("seller_product");
            }
        }
        return mv;
    }
}
