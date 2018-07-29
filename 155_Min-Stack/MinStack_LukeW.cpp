#include<iostream>
#include<stack>
using namespace std;

class MinStack {
private:
    stack<int> dataStack;
    stack<int> minStack;

public:
    /** initialize your data structure here. */
    MinStack() {}
    
    void push(int x) {
        dataStack.push(x);
        
        if(minStack.empty()) { 
            minStack.push(x);
        }
        else {
            int minOnMinStack = minStack.top();
            if(x < minOnMinStack) {
                minStack.push(x);
            }
            else {
                minStack.push(minOnMinStack);
            }
        }
    }
    
    void pop() {
        dataStack.pop();
        minStack.pop();
    }
    
    int top() {
        return dataStack.top();
    }
    
    int getMin() {
        return minStack.top();
    }
};

int main() {
    MinStack minStack;
    minStack.push(-2);
    minStack.push(0);
    minStack.push(-3);
    minStack.getMin();   //--> Returns -3.
    cout << "Now Min is: " << minStack.getMin() << "  Hope is: -3\n";

    minStack.pop();
    minStack.top();      //--> Returns 0.
    minStack.getMin();   //--> Returns -2.
    cout << "Now Min is: " << minStack.getMin() << "  Hope is: -2";

    return 0;
}