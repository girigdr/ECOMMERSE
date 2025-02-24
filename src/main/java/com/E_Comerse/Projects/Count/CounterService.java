package com.E_Comerse.Projects.Count;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class CounterService {

    private final CounterRepository counterRepository;

    public CounterService(CounterRepository counterRepository) {
        this.counterRepository = counterRepository;
    }

    @Transactional
    public int incrementCount() {
        Counter counter = counterRepository.findById(1L).orElse(new Counter(0));
        counter.setCount(counter.getCount() + 1);
        counterRepository.save(counter);
        return counter.getCount();
    }

    public int getCurrentCount() {
        return counterRepository.findById(1L).map(Counter::getCount).orElse(0);
    }
}
