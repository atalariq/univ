from stack import Stack

operator = {
    "+": 1,
    "-": 1,
    "*": 2,
    "/": 2,
    "^": 3,
}


def postfix_to_infix(postfix):
    stack = Stack()
    for token in postfix:
        if token in operator.keys():
            op1 = stack.pop()
            op2 = stack.pop()
            s = f"({op2}{token}{op1})"
            stack.push(s)
        else:
            stack.push(token)
    return stack.pop()


if __name__ == "__main__":
    print(postfix_to_infix("mn*pq-+r+"))  # expect: m*n+(p-q)+r
    print(postfix_to_infix("ab+cde*f/^-g+"))  # expect: a+b-c^(d*e/f)+g
    print(postfix_to_infix("pq*rstu+^-v+-"))  # expect: p*q-(r-s^(t+u)+v)
