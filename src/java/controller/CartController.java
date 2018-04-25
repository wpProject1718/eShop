package controller;

import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class CartController {

    ModelAndView mv = new ModelAndView();

    @RequestMapping(value = "/cart", method = RequestMethod.GET)
    public ModelAndView cart(HttpServletRequest request) {
        mv.setViewName("login");
        if (request.getSession().getAttribute("type") != null) {
            int type = (int) request.getSession().getAttribute("type");
            mv.addObject("userid", request.getParameter("userid"));
            mv.setViewName("shoppingCart");
        }
        return mv;
    }

    @RequestMapping(value = "/addtocart")
    public ModelAndView addCart(HttpServletRequest request) {
        mv.setViewName("login");
        if (request.getSession().getAttribute("userid") != null) {
            mv.addObject("uid", request.getParameter("uid"));
            mv.addObject("pid", request.getParameter("pid"));
            mv.addObject("quantity", request.getParameter("quantity"));
            mv.setViewName("addtocart");
        }
        return mv;
    }

    @RequestMapping(value = "/removecart")
    public ModelAndView removeCart(HttpServletRequest request) {
        mv.setViewName("login");
        if (request.getSession().getAttribute("userid") != null) {
            mv.addObject("uid", request.getParameter("uid"));
            mv.addObject("pid", request.getParameter("pid"));
            mv.setViewName("removecart");
        }
        return mv;
    }

    @RequestMapping(value = "/checkout")
    public ModelAndView checkout(HttpServletRequest request) {
        mv.setViewName("login");
        if (request.getSession().getAttribute("userid") != null) {
            mv.setViewName("receipt");
        }
        return mv;
    }
}
