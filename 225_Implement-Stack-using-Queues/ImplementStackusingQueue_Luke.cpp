#include<iostream>
#include<queue>
using namespace std;

class MyStack {
private:
    queue<int> myqueue;

public:
    /** Initialize your data structure here. */
    MyStack() {}
    
    /** Push element x onto stack. */
    void push(int x) {
        myqueue.push(x);
        for(int i=0; i < myqueue.size() - 1 ;i++) {
            myqueue.push(myqueue.front());
            myqueue.pop();
        }
    }
    
    /** Removes the element on top of the stack and returns that element. */
    int pop() {
        int value;
        value = myqueue.front();
        myqueue.pop();
        return value;
    }
    
    /** Get the top element. */
    int top() {
        return myqueue.front();
    }
    
    /** Returns whether the stack is empty. */
    bool empty() {
        return myqueue.size() == 0;
    }
};

int main() {
 
        MyStack stack;
        stack.push(1);
        stack.push(2);  
        stack.top();   // returns 2
        cout << "get top: " << stack.top() << "\n";
        stack.pop();   // returns 2
        cout << "get top: " << stack.top() << "\n";
        stack.empty(); // returns false
        cout << "check stack: " << stack.empty();  

    return 0;
}

/**
 * Your MyStack object will be instantiated and called as such:
 * MyStack obj = new MyStack();
 * obj.push(x);
 * int param_2 = obj.pop();
 * int param_3 = obj.top();
 * bool param_4 = obj.empty();
 */

