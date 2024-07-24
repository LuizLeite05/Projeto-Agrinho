let coracao1 = "coracaoVerde.png";
let coracao2 = "coracaoVerdeInteiro.png";

function favoritar() {
  document.getElementById("coracao").src = coracao1;
  let aux = coracao2;
  coracao2 = coracao1;
  coracao1 = aux;
}
