# Infix to Postfix and Vice Versa - Pseudocode Edition

```
FUNCTION precedence(operator)
  IF operator IS '^' THEN
    RETURN 3
  ELSE IF operator IS '*' OR '/' THEN
    RETURN 2
  ELSE IF operator IS '+' OR '-' THEN
    RETURN 1
  ELSE
    RETURN 0 // For '('
  END IF
END FUNCTION
```

```
FUNCTION infixToPostfix(infix_expression)
  CREATE empty stack operator_stack
  CREATE empty string postfix_expression

  FOR EACH character token IN infix_expression
    IF token IS operand (letter or digit) THEN
      APPEND token TO postfix_expression
    ELSE IF token IS '(' THEN
      PUSH token ONTO operator_stack
    ELSE IF token IS ')' THEN
      WHILE TOP of operator_stack IS NOT '('
        APPEND POP from operator_stack TO postfix_expression
      END WHILE
      POP from operator_stack // Discard the '('
    ELSE IF token IS operator THEN
      WHILE operator_stack IS NOT empty AND precedence(token) <= precedence(TOP of operator_stack)
        APPEND POP from operator_stack TO postfix_expression
      END WHILE
      PUSH token ONTO operator_stack
    END IF
  END FOR

  WHILE operator_stack IS NOT empty
    APPEND POP from operator_stack TO postfix_expression
  END WHILE

  RETURN postfix_expression
END FUNCTION
```


```
FUNCTION postfixToInfix(postfixExpression):
    CREATE an empty stack of strings
    
    FOR each token in postfixExpression:
        if token is an operand (letter or number):
            stack.push(token)
        else if token is an operator (+, -, *, /, etc.):
            // Pop top two operands, note the order: 
            // op2 is popped first, then op1
            op1 = stack.pop()
            op2 = stack.pop()
            
            // Form string: (operand2 operator operand1)
            newString = "(" + op2 + " " + token + " " + op1 + ")"
            stack.push(newString)
            
    // The final result is the only item left in the stack
    RETURN stack.pop()
```
