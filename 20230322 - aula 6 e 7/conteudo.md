# Aula 6 -> Predição de Séries Temporais com MLP

- Previsão de demanda em séries temporais pode ser feita em decomposição STR -> a cominação pode ser feita de forma linear S+T+R ou por pesos / não linear;
- Indicadores a pesquisar para verificar o prazo de previsão: RMSE, RME, MAE...;
- Melhor modelo que existe para bolsa de valores é o passeio aleatório (andar de bêbado);
- Em séries temporais difícil ter acurácia, é mais fácil ter erros médios quadráticos;
- Atividade para próxima aula (desafio) -> 4 cenários
1. Cenário que vai projetar 4 dias, 10, 15, 20 dias;
2. Para cada cenário tira dados do treinamento;
3. A princípio, não mexer no tamanho da janela;
4. Além -> brincar um pouco com a janela deslizante como se fosse uma média móvel;



Links de implementações explorados em aula:

- Git A.Geron, livro de Machine Learning: ageron (Aurélien Geron) · GitHub(https://github.com/ageron)
- Exemplos dos conceitos envolvidos em Deep Learning e Rede Neural Convoluvional: handson-ml3/14_deep_computer_vision_with_cnns.ipynb at main · ageron/handson-ml3 · GitHub(https://github.com/ageron/handson-ml3/blob/main/14_deep_computer_vision_with_cnns.ipynb)
- Exemplo de soluções do mnist (digits recognition):
handson-ml3/03_classification.ipynb at a858c72c76d42285d73c7f3b21dc9f4302c4bd26 · ageron/handson-ml3 · GitHub
MNIST_DIGIT RECOGNIZER | Kaggle(https://github.com/ageron/handson-ml3/blob/a858c72c76d42285d73c7f3b21dc9f4302c4bd26//03_classification.ipynb e https://www.kaggle.com/code/amirdhavarshinis/mnist-digit-recognizer)
- Endereço para o dataset: Recognizing hand-written digits — scikit-learn 1.2.2 documentation(https://scikit-learn.org/stable/auto_examples/classification/plot_digits_classification.html)
