from stack import Stack

operator = {
    "(": 0,
    "+": 1,
    "-": 1,
    "*": 2,
    "/": 2,
    "^": 3,
}


def infix_to_postfix(infix):
    stack = Stack()
    postfix = ""

    for token in infix:
        if token == "(":
            stack.push(token)
        elif token == ")":
            while not stack.empty() and stack.peek() != "(":
                postfix += stack.peek()
                stack.pop()
            stack.pop()
        elif token in operator.keys():
            while not stack.empty() and operator[token] <= operator[stack.peek()]:
                postfix += stack.peek()
                stack.pop()
            stack.push(token)
        else:
            postfix += token

    while not stack.empty():
        postfix += stack.peek()
        stack.pop()

    return postfix


if __name__ == "__main__":
    print(infix_to_postfix("m*n+(p-q)+r"))  # expect: mn*pq-+r+
    print(infix_to_postfix("a+b-c^(d*e/f)+g"))  # expect: ab+cde*f/^-g+
    print(infix_to_postfix("p*q-(r-s^(t+u)+v)"))  # expect: pq*rstu+^-v+-
