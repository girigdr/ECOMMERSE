package com.E_Comerse.Projects.Count;

import org.springframework.web.bind.annotation.*;

@RestController
@CrossOrigin(origins = "*")
@RequestMapping("/counter")
public class CounterController {

    private final CounterService counterService;

    public CounterController(CounterService counterService) {
        this.counterService = counterService;
    }

    @PostMapping("/increment")
    public int incrementCounter() {
        return counterService.incrementCount();
    }

    @GetMapping("/current")
    public int getCurrentCount() {
        System.out.println("cooooooooooooooooooooooooooo");
        return counterService.getCurrentCount();
    }
}
