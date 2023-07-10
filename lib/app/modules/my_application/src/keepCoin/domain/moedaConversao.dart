class MoedaConversao {
  String moeda;
  String moedaOrigem;
  String titulo;
  String compra;
  String venda;
  String variacao;
  String pctVariacao;
  String maximo;
  String minimo;

  MoedaConversao({
    required this.moeda,
    required this.moedaOrigem,
    required this.titulo,
    required this.compra,
    required this.venda,
    required this.variacao,
    required this.pctVariacao,
    required this.maximo,
    required this.minimo,
  });

  factory MoedaConversao.fromJson(Map<String, dynamic> json) {
    return MoedaConversao(
      moeda: json['code'],
      moedaOrigem: json['codein'],
      titulo: json['name'],
      compra: json['bid'],
      venda: json['ask'],
      variacao: json['varBid'],
      pctVariacao: json['pctChange'],
      maximo: json['high'],
      minimo: json['low'],
    );
  }
}

