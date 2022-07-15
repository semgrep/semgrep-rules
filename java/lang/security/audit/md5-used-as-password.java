package website.controller;

import website.RandomUtil;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.hibernate.service.spi.ServiceException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.*;
import java.security.MessageDigest;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/user")
public class UserController extends BaseController {

    private final UserService service;

    @Autowired
    public UserController(UserService service) {
        this.service = service;
    }

    @RequestMapping(value = "addUser", method = RequestMethod.POST)
    public Result addUser(@RequestBody UserModel user) {
        UserModel userModel = service.findUserByEmail(user.getEmail());
        if (userModel != null) {
            return new Result<>(CodeConst.USER_REPEAT.getResultCode(), CodeConst.USER_REPEAT.getMessage());
        }

        String salt = RandomUtil.createSalt();
        MessageDigest md = MessageDigest.getInstance("MD5");
        md.update(user.getPassword());

        // ruleid: md5-used-as-password
        user.setPassword(md.digest(), salt);

        user.setValidateCode(Md5Util.encode(user.getEmail(), ""));
        user.setSalt(salt);
        service.addUser(user);
        return new Result<>(user);
    }

    @RequestMapping(value = "addUserOk", method = RequestMethod.POST)
    public Result addUserOk(@RequestBody UserModel user) {
        UserModel userModel = service.findUserByEmail(user.getEmail());
        if (userModel != null) {
            return new Result<>(CodeConst.USER_REPEAT.getResultCode(), CodeConst.USER_REPEAT.getMessage());
        }

        String salt = RandomUtil.createSalt();
        MessageDigest md = MessageDigest.getInstance("SHA-256");
        md.update(user.getPassword());

        // ok: md5-used-as-password
        user.setPassword(md.digest(), salt);

        user.setValidateCode(Md5Util.encode(user.getEmail(), ""));
        user.setSalt(salt);
        service.addUser(user);
        return new Result<>(user);
    }
}
