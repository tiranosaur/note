package org.example;

import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.Semaphore;

class SharedResource {
    public void useResource(int threadNumber) {
        System.out.println("Thread " + threadNumber + " ++++++++++++++++++++++++++++++++++");
        try {
            Thread.sleep(1000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        System.out.println("Thread " + threadNumber + " ---");
    }
}

class WorkerThread extends Thread {
    private final int threadNumber;
    private final Semaphore semaphore;
    private final SharedResource sharedResource;

    public WorkerThread(int threadNumber, Semaphore semaphore, SharedResource sharedResource) {
        this.threadNumber = threadNumber;
        this.semaphore = semaphore;
        this.sharedResource = sharedResource;
    }

    @Override
    public void run() {
        try {
            semaphore.acquire();
            sharedResource.useResource(threadNumber);
        } catch (InterruptedException e) {
            e.printStackTrace();
        } finally {
            semaphore.release();
        }
    }
}

public class Main {
    public static void main(String[] args) throws Exception {
        Semaphore semaphore = new Semaphore(5);
        SharedResource sharedResource = new SharedResource();

        List<Thread> list = new ArrayList<>();
        for (int i = 0; i < 10; i++) {
            WorkerThread thread = new WorkerThread(i, semaphore, sharedResource);
            list.add(thread);
            thread.start();
        }

        for (Thread thread : list) {
            thread.join();
        }

        System.out.println();
    }
}
