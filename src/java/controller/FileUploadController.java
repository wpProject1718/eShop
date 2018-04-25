package controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

/**
 * Handles requests for the application file upload requests
 */
@Controller
public class FileUploadController {

    private static final Logger logger = LoggerFactory
            .getLogger(FileUploadController.class);

    /**
     * Upload single file using Spring Controller
     */
    @RequestMapping(value = "/addproduct")
    public ModelAndView uploadPage() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("addProduct");

        return mv;
    }

    @RequestMapping(value = "/uploadFile")
    public @ResponseBody
    String uploadFileHandler(@RequestParam(value = "file") MultipartFile file) {
        
        if (!file.isEmpty()) {
            try {
                byte[] bytes = file.getBytes();
                String name = file.getOriginalFilename();
                // Creating the directory to store file
                String rootPath = "Your_path_to/eShop/web/resources";
                File dir = new File(rootPath + File.separator);
                if (!dir.exists()) {
                    dir.mkdirs();
                }

                // Create the file on server
                File serverFile = new File(dir.getAbsolutePath()
                        + File.separator + name);
                BufferedOutputStream stream = new BufferedOutputStream(
                        new FileOutputStream(serverFile));
                stream.write(bytes);
                stream.close();

                logger.info("Server File Location="
                        + serverFile.getAbsolutePath());

                return "You successfully uploaded file:" + name + serverFile.getAbsolutePath();
            } catch (Exception e) {
                return "You failed to upload file => " + e.getMessage();
            }
        } else {
            return "You failed to upload file because the file was empty.";
        }
    }
}
