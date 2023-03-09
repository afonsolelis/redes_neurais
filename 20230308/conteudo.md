# Revisão do exercício da aula 2
- Procurar o algoritimo de ada bush


# Aula 3 -> Metodologias para Validar Modelos Preditivos

- Análise preditiva -> separar o total de dados, um para treinar e outro para validar;
- Overfitting(Sobreajuste) -> Quando está exatamente em cima das bolinhas de treinamento, significa que ela apenas decorou, e não aprendeu. Overfitting quer dizer que ele não consegue se adaptar à diferentes tipos de dados;
- Mas tem o caso do erro ser muito grande, e que pode ter vários significados/hipóteses:
    1. Parametrizei mal meu modelo?
    2. O conjunto de dados tem uma complexidade alta que não pode treinar?
- Geralmente se coloca um outro modelo para fim de comparar se o problema são nos dados ou no modelo;
- Outra forma de verificar o overfitting: comparar o gráfico de erro do conjunto de treino x conjunto de teste -> se no final o erro aumenta no final pode significar o overfitting;
- Então devemos fazer um treino/teste/validação, 3 conjuntos;
- Pensar em um modelo de amostragem estratificada que melhore a ramificação de testes;
- Pesquisar sobre a semante em métodos aleatórios em validação cruzada;
- Pesquisar sobre a matriz confusão para predição categórica;
- Pesquisar mais sobre F-Score;
- Pesquisar mais sobre G-means;
- Tamém sobre a curva ROC;
- Quando a medida é contínua, nada acima funciona, tem que ir para erro absoluto - erro quadrado médio - erro médio absoluto, e outras;

