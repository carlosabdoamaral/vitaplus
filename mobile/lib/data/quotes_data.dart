import 'dart:math';

import 'package:vitaplus/models/quote_model.dart';

List<QuoteModel> quotesData = [
  QuoteModel(
    id: 1,
    text: "O sucesso é ir de fracasso em fracasso sem perder entusiasmo.",
    author: "Winston Churchill",
  ),
  QuoteModel(
    id: 2,
    text: "O único lugar onde o sucesso vem antes do trabalho é no dicionário.",
    author: "Albert Einstein",
  ),
  QuoteModel(
    id: 3,
    text: "A persistência é o caminho do êxito.",
    author: "Charles Chaplin",
  ),
  QuoteModel(
    id: 4,
    text: "Nossos fracassos, às vezes, são mais frutíferos do que os êxitos.",
    author: "Henry Ford",
  ),
  QuoteModel(
    id: 5,
    text:
        "Só se pode alcançar um grande êxito quando nos mantemos fiéis a nós mesmos.",
    author: "Friedrich Nietzsche",
  ),
  QuoteModel(
    id: 6,
    text:
        "O sucesso não consiste em não errar, mas não cometer os mesmos equívocos mais de uma vez.",
    author: "George Bernard Shaw",
  ),
  QuoteModel(
    id: 7,
    text:
        "Tudo o que um sonho precisa para ser realizado é alguém que acredite que ele possa ser realizado.",
    author: "Roberto Shinyashiki",
  ),
  QuoteModel(
    id: 8,
    text:
        "O insucesso é apenas uma oportunidade para recomeçar com mais inteligência.",
    author: "Henry Ford",
  ),
  QuoteModel(
    id: 9,
    text:
        "Aquele que quer ser bem-sucedido precisa aprender a lutar por seus objetivos.",
    author: "Desconhecido",
  ),
  QuoteModel(
    id: 10,
    text: "Você não é derrotado quando perde. Você é derrotado quando desiste.",
    author: "Desconhecido",
  ),
  QuoteModel(
    id: 11,
    text:
        "Para ser um campeão você tem que acreditar em si mesmo quando ninguém mais acredita.",
    author: "Muhammad Ali",
  ),
  QuoteModel(
    id: 12,
    text: "O que não provoca minha morte faz com que eu fique mais forte.",
    author: "Friedrich Nietzsche",
  ),
  QuoteModel(
    id: 13,
    text:
        "Acredite em si próprio e chegará um dia em que os outros não terão outra escolha senão acreditar com você.",
    author: "Cynthia Kersey",
  ),
  QuoteModel(
    id: 14,
    text:
        "Não é o que acontece com você, mas como você reage ao que acontece que determina seu destino.",
    author: "Epicteto",
  ),
  QuoteModel(
    id: 15,
    text:
        "O homem não teria alcançado o possível se, repetidas vezes, não tivesse tentado o impossível.",
    author: "Max Weber",
  ),
  QuoteModel(
    id: 16,
    text: "A persistência realiza o impossível.",
    author: "Desconhecido",
  ),
  QuoteModel(
    id: 17,
    text: "O sucesso é a soma de pequenos esforços repetidos dia após dia.",
    author: "Robert Collier",
  ),
  QuoteModel(
    id: 18,
    text:
        "Grandes mentes discutem ideias; mentes medianas discutem eventos; mentes pequenas discutem pessoas.",
    author: "Eleanor Roosevelt",
  ),
  QuoteModel(
    id: 19,
    text:
        "Não é o que você faz de vez em quando que molda sua vida, é o que você faz consistentemente.",
    author: "Tony Robbins",
  ),
  QuoteModel(
    id: 20,
    text:
        "Um sonho não se torna realidade através da magia; exige suor, determinação e trabalho duro.",
    author: "Colin Powell",
  ),
  QuoteModel(
    id: 21,
    text:
        "Não espere por uma crise para descobrir o que é importante em sua vida.",
    author: "Platão",
  ),
  QuoteModel(
    id: 22,
    text:
        "O sucesso não é o resultado de um esforço único, mas sim do esforço contínuo.",
    author: "Samuel Johnson",
  ),
  QuoteModel(
    id: 23,
    text:
        "Apenas aqueles que ousam ter grandes fracassos acabam conseguindo grandes sucessos.",
    author: "Robert F. Kennedy",
  ),
  QuoteModel(
    id: 24,
    text:
        "A coragem não é ausência de medo, mas a persistência apesar do medo.",
    author: "Desconhecido",
  ),
  QuoteModel(
    id: 25,
    text: "O único lugar onde o sucesso vem antes do trabalho é no dicionário.",
    author: "Vidal Sassoon",
  ),
  QuoteModel(
    id: 26,
    text: "O sucesso é a soma de pequenos esforços repetidos dia após dia.",
    author: "Robert Collier",
  ),
  QuoteModel(
    id: 27,
    text: "Não é o que você olha que importa, é o que você vê.",
    author: "Henry David Thoreau",
  ),
  QuoteModel(
    id: 28,
    text:
        "O sucesso normalmente vem para quem está ocupado demais para procurar por ele.",
    author: "Henry David Thoreau",
  ),
  QuoteModel(
    id: 29,
    text: "O único lugar onde o sucesso vem antes do trabalho é no dicionário.",
    author: "Vidal Sassoon",
  ),
  QuoteModel(
    id: 30,
    text: "A persistência é o caminho do êxito.",
    author: "Charles Chaplin",
  ),
  QuoteModel(
    id: 31,
    text: "Não deixe o medo de perder ser maior que a excitação de ganhar.",
    author: "Robert Kiyosaki",
  ),
  QuoteModel(
    id: 32,
    text:
        "O que você realmente quer para sua vida é mais importante que o que você quer agora.",
    author: "Zig Ziglar",
  ),
  QuoteModel(
    id: 33,
    text:
        "Quando você quer alguma coisa, todo o Universo conspira para que você realize seu desejo.",
    author: "Paulo Coelho",
  ),
  QuoteModel(
    id: 34,
    text: "Comece onde você está. Use o que você tem. Faça o que você pode.",
    author: "Arthur Ashe",
  ),
  QuoteModel(
    id: 35,
    text: "Você é capaz de realizar tudo o que deseja.",
    author: "Desconhecido",
  ),
  QuoteModel(
    id: 36,
    text: "Mantenha seus olhos nas estrelas e seus pés no chão.",
    author: "Theodore Roosevelt",
  ),
  QuoteModel(
    id: 37,
    text: "Nada vai mudar se você não mudar.",
    author: "Jim Rohn",
  ),
  QuoteModel(
    id: 38,
    text: "Você é maior do que seus problemas.",
    author: "Desconhecido",
  ),
  QuoteModel(
    id: 39,
    text: "Tudo o que você sempre quis está do outro lado do medo.",
    author: "George Addair",
  ),
  QuoteModel(
    id: 40,
    text: "A jornada de mil milhas começa com um único passo.",
    author: "Lao Tzu",
  ),
  QuoteModel(
    id: 41,
    text: "A dor que você sente hoje será a força que você sentirá amanhã.",
    author: "Desconhecido",
  ),
  QuoteModel(
    id: 42,
    text: "Não pare quando estiver cansado, pare quando tiver terminado.",
    author: "Desconhecido",
  ),
];

QuoteModel getRandomQuote() {
  var i = Random().nextInt(quotesData.length);
  return quotesData[i];
}
