//
//  main.cpp
//  232_ImplementQueueUsingStacks
//
//  Created by Nixon.Shih on 2018/7/5.
//  Copyright © 2018年 Nixon.Shih. All rights reserved.
//

#include <iostream>
#include <stack>

using namespace std;

class MyQueue {
    stack<int> *container;
public:
    /** Initialize your data structure here. */
    MyQueue(): container(new stack<int>()) {}
    
    /** Push element x to the back of queue. */
    void push(int x) {
        container->push(x);
    }
    
    /** Removes the element from in front of queue and returns that element. */
    int pop() {
        if (empty()) {
            cout << "The Queue is empty." << endl;
            return -1;
        }
        
        stack<int> temp = stack<int>();
        
        while (true) {
            
            if (container->size() == 1) { break; }
            
            int data = container->top();
            container->pop();
            temp.push(data);
        }
        
        int result = container->top();
        container->pop();
        
        while (!temp.empty()) {
            int data = temp.top();
            temp.pop();
            container->push(data);
        }
        
        return result;
    }
    
    /** Get the front element. */
    int peek() {
        if (empty()) {
            cout << "The Queue is empty." << endl;
            return -1;
        }
        
        stack<int> temp = *container;
        
        while (true) {
            if (temp.size() == 1) { break; }
            temp.pop();
        }
        
        return temp.top();
    }
    
    /** Returns whether the queue is empty. */
    bool empty() {
        return container->empty();
    }
};


int main(int argc, const char * argv[]) {
    
    //    MyQueue queue = MyQueue();
    //    queue.push(1);
    //    queue.push(2);
    //    queue.push(3);
    //    cout << queue.pop() << endl;
    //    cout << queue.pop() << endl;
    //    cout << queue.pop() << endl;
    //    cout << (queue.empty() ? "true" : "false") << endl;
    
    MyQueue queue = MyQueue();
    queue.push(1);
    queue.push(2);
    cout << queue.peek() << endl;
    cout << queue.pop() << endl;
    cout << (queue.empty() ? "true" : "false") << endl;
    
    return 0;
}
