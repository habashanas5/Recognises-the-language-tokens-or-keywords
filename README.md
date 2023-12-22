Using lex to create a lexical analyser that can be used as tokeniser for below grammar.
program::= model  train predict
model ::= model m_type (name ){ layer* }
m_type ::= sequential 
layer ::= layer (type = l_type , in= number ,out= number activation= activation)
l_type ::= input |dense  | output
activation ::= sigmoid | tanh | relu
train ::= train ( data= file_name ,  labels= file_name , loss= loss, optimizer= optimizer epochs= number, metrics= [metric*]) 
loss ::= mse | cross_entropy
optimizer ::= adam | rmsprop | sgd
metric ::= accuracy| 
predict ::= predict (file_name)
