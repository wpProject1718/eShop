package controller;

import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ViewProductController {

    ModelAndView mv = new ModelAndView();

    @RequestMapping(value = "/product", method = RequestMethod.GET)
    public ModelAndView product(HttpServletRequest request) {
        mv.addObject("productid", request.getParameter("productid"));
        mv.setViewName("view_product");
        return mv;
    }
}
