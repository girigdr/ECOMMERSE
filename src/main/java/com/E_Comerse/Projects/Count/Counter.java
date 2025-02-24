package com.E_Comerse.Projects.Count;

import jakarta.persistence.*;

@Entity
@Table(name = "counter_table")
public class Counter {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private int count;

    public Counter() {
    }

    public Counter(int count) {
        this.count = count;
    }

    public Long getId() {
        return id;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }
}
