package org.example;

import lombok.SneakyThrows;

import java.util.*;
import java.util.concurrent.*;

public class Main {
    static Random random = new Random();

    public static void main(String[] args) throws Exception {
        ExecutorService executorService = Executors.newFixedThreadPool(3);

        List<Future<String>> futureLeagueEvents = new ArrayList<>();
        for (int i = 0; i < 20; i++) {
            int id = i;
            Future<String> future = executorService.submit(() -> generateString(id));
            futureLeagueEvents.add(future);
            System.out.println(i);
        }

        List<String> result = new ArrayList<>();
        for (Future<String> future : futureLeagueEvents) {
            result.add(future.get());
        }

        System.out.println(result);
    }

    @SneakyThrows
    private static String generateString(int id) {
        String generatedString = random.ints(48, 122)
                .limit(32)
                .collect(StringBuilder::new, StringBuilder::appendCodePoint, StringBuilder::append)
                .toString();
        Thread.sleep(1000);
//        Thread.sleep(random.nextInt(3000));
        System.out.printf("Generated string: #%s\n", id);
        return generatedString;
    }
}
