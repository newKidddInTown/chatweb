package jp.mrduc.me.chatweb.api;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class GreetingController {
  @GetMapping("/hello")
  public String greeting() {
    return "Hi";
  }

}
