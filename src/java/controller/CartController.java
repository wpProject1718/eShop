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
    public ModelAndView product(HttpServletRequest request) {
        mv.setViewName("home");
        if (request.getSession().getAttribute("type") != null) {
            int type = (int) request.getSession().getAttribute("type");
            if (type == 1) {
                mv.addObject("userid", request.getParameter("userid"));
                mv.setViewName("shoppingCart");
            }
        }
        return mv;
    }
}
