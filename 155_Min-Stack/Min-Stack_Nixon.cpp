//
//  Min-Stack_Nixon.cpp
//  PracticeStack
//
//  Created by Nixon.Shih on 2018/7/3.
//  Copyright © 2018年 Nixon.Shih. All rights reserved.
//

#include <iostream>
using namespace std;

class StackNode {
    int value;
    StackNode* node;
public:
    friend class Stack;
    StackNode();
    StackNode(int x);
    StackNode(int x, StackNode* node);
};

class Stack {
    StackNode* topNode;
    int size;
public:
    Stack();
    void push(int x);
    void pop();
    int top();
    int count();
    bool isEmpty();
    void printCurrentStatus();
};


StackNode::StackNode() {};
StackNode::StackNode(int x): value(x), node(NULL) {};
StackNode::StackNode(int x, StackNode* node): value(x), node(node) {}

Stack::Stack(): size(0), topNode(NULL) {}

void Stack::push(int x) {
    
    StackNode* node = new StackNode(x);
    size += 1;
    
    if (isEmpty()) {
        topNode = node;
        return;
    }
    
    node->node = topNode;
    topNode = node;
}

void Stack::pop() {
    
    if (isEmpty()) {
        cout << "Nothing can pop in stack." << endl;
        return;
    }
    
    size -= 1;
    
    StackNode* temp = topNode;
    topNode = topNode->node;
    delete temp;
}

int Stack::top() {
    if (isEmpty()) {
        cout << "Stack is empty." << endl;
        return -1;
    }
    return topNode->value;
}

bool Stack::isEmpty() {
    return topNode == NULL;
}

int Stack::count() {
    return size;
}

void Stack::printCurrentStatus() {
    cout << "Top -> ";
    StackNode* current = topNode;
    while (current != NULL) {
        cout << current->value << " -> ";
        current = current-> node;
    }
    cout << "Bottom" << endl;
}

class MinStack {
    Stack dataStack;
    Stack orderStack;
public:
    MinStack();
    void push(int x);
    void pop();
    int top();
    int getMin();
};

MinStack::MinStack(): dataStack(Stack()), orderStack(Stack()) {}

void MinStack::push(int x) {
    dataStack.push(x);
    if (orderStack.isEmpty()) {
        orderStack.push(x);
    }else{
        int element = x > orderStack.top() ? orderStack.top() : x;
        orderStack.push(element);
    }
}

void MinStack::pop() {
    
    if (dataStack.isEmpty()) {
        cout << "The stack is empty." << endl;
        return;
    }
    
    dataStack.pop();
    orderStack.pop();
}

int MinStack::top() {
    
    if (dataStack.isEmpty()) {
        cout << "The stack is empty." << endl;
        return -1;
    }
    return dataStack.top();
}

int MinStack::getMin() {
    
    if (orderStack.isEmpty()) {
        cout << "The stack is empty." << endl;
        return -1;
    }
    return orderStack.top();
}
