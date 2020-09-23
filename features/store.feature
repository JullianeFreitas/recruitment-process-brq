#language:pt

Funcionalidade: Testar os fluxos do sistema de prática de automação da BRQ

  Esquema do Cenário: Realizar uma compra com sucesso
    Dado que eu busco pelo produto "<descricao_produto>"
    Quando adiciono esse produto ao carrinho, validando o sucesso através da mensagem:
      | mensagem |
      | Product successfully added to your shopping cart |
    E prossigo para o checkout
    Entao eu valido se a "<descricao_produto>" está no carrinho com as seguintes informações:
      | disponibilidade   | preco_unitario   | total_produtos   | total_frete   | total_sem_taxas   | taxas   | preco_total   |
      | <disponibilidade> | <preco_unitario> | <total_produtos> | <total_frete> | <total_sem_taxas> | <taxas> | <preco_total> |
    Quando avanço para a aba de autenticação
    E eu crio uma conta com as seguintes informações pessoais:
      | titulo | nome   |  sobrenome  | senha  | data_nascimento | receber_noticia | receber_oferta |
      | Mrs.   | <nome> | <sobrenome> | 1m@5$9 | 26/10/1992      | Não             | Sim            |
    E com as seguintes informações de endereço: 
      | nome   |  sobrenome  | endereco  | cidade   | estado | cep   | celular       | apelido_endereco     |
      | <nome> | <sobrenome> | Savier St | Portland | Oregon | 12345 | (88)8888-8888 | Endereco Residencial |
    E avanço para a aba de endereço
    Entao valido que o endereço registrado está correto
    Quando avanço para a aba de envio
    Entao confirmo as informações de envio com os parâmetros:
      | total_frete   | aceita_termos_servico |
      | <total_frete> | Sim                   |
    Quando avanço para a aba de pagamento
    Entao valido o valor total da compra de "<preco_total>"
    Quando escolho o meio de pagamento por "<meio_pagamento>"
    Entao confirmo o pedido, validando se foi finalizada com sucesso

    Exemplos:
      | descricao_produto           | nome  | sobrenome | meio_pagamento         | disponibilidade | preco_unitario | total_produtos | total_frete | total_sem_taxas | taxas | preco_total |
      | Faded Short Sleeve T-shirts | Paula | Martins   | Cheque                 | In stock        | $16.51         | $16.51         | $2.00       | $18.51          | $0.00 | $18.51      |
      | Blouse                      | Luisa | Prado     | Transferência bancária | In stock        | $27.00         | $27.00         | $2.00       | $29.00          | $0.00 | $29.00      |