//
//  main.cpp
//  225_ImplementStackusingQueues
//
//  Created by Nixon.Shih on 2018/7/6.
//  Copyright © 2018年 Nixon.Shih. All rights reserved.
//

#include <iostream>
#include <queue>

using namespace std;

class MyStack {
    queue<int>* container;
public:
    /** Initialize your data structure here. */
    MyStack(): container(new queue<int>()) {}
    
    /** Push element x onto stack. */
    void push(int x) {
        container->push(x);
    }
    
    /** Removes the element on top of the stack and returns that element. */
    int pop() {
        
        if (empty()) {
            cout << "The stack is empty" << endl;
            return -1;
        }
        
        queue<int>* temp = new queue<int>();
        
        while (container->size() > 1) {
            int data = container->front();
            temp->push(data);
            container->pop();
        }
        int result = container->front();
        delete container;
        container = temp;

        return result;
    }
    
    /** Get the top element. */
    int top() {
        
        if (empty()) {
            cout << "The stack is empty" << endl;
            return -1;
        }
        
        return container->back();
    }
    
    /** Returns whether the stack is empty. */
    bool empty() {
        return container->empty();
    }
};

int main(int argc, const char * argv[]) {
    
    MyStack obj = MyStack();
    obj.push(1);
    obj.push(2);
    cout << obj.pop() << endl;
    cout << obj.top() << endl;
    cout << (obj.empty() ? "true" : "false") << endl;
    
    return 0;
}
