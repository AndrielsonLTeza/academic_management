# Reflexão sobre o Uso de IA

Uma análise crítica sobre como a ferramenta de IA impactou o desenvolvimento deste projeto.

* **Pontos Positivos:** A IA foi extremamente eficiente em diagnosticar rapidamente falhas de arquitetura de plataforma (como a tentativa de rodar o SQLite no navegador) e guiar os comandos de CLI corretos do Flutter para ativar o emulador sem que fosse necessário abrir a interface pesada do Android Studio.
* **Limitações e Desafios:** A IA depende totalmente do contexto visual e dos logs do terminal fornecidos pelo desenvolvedor. Em momentos de travamento de comandos (como nomes de dispositivos com caracteres incorretos), o olhar atento do desenvolvedor para reiniciar o processo é fundamental.
* **Conclusão:** O uso da IA atuou como um par de "Pair Programming" técnico, acelerando a configuração do ambiente de testes e garantindo que os critérios de aceitação da folha de avaliação fossem atingidos com precisão.