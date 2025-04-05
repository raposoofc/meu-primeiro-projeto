let contador = 1;
let matriz = [];

function validarLogin() {
  const login = document.getElementById("login").value;
  const senha = document.getElementById("senha").value;
  const mensagem = document.getElementById("mensagemLogin");

  if (login === "admin" && senha === "*****") {
    document.getElementById("login-screen").style.display = "none";
    document.getElementById("menu").style.display = "block";
  } else {
    mensagem.textContent = "Login ou senha incorretos!";
  }
}

function mostrarCadastro() {
  document.getElementById("menu").style.display = "none";
  document.getElementById("cadastro").style.display = "block";
}

function mostrarConsulta() {
  document.getElementById("menu").style.display = "none";
  document.getElementById("consulta").style.display = "block";
}

function voltarMenu() {
  document.getElementById("cadastro").style.display = "none";
  document.getElementById("consulta").style.display = "none";
  document.getElementById("menu").style.display = "block";
}

function gerarId(num) {
  return num.toString().padStart(6, "0");
}

function cadastrar() {
  if (contador > 100) {
    alert("Erro: A matriz de cadastros está cheia!");
    return;
  }

  const item = [
    gerarId(contador),
    document.getElementById("nome").value,
    document.getElementById("data").value,
    document.getElementById("valor").value,
    document.getElementById("setor").value,
    document.getElementById("responsavel").value,
    document.getElementById("casa").value,
  ];

  matriz.push(item);
  contador++;
  alert("Item cadastrado com sucesso!");
}

function consultar() {
  const tipo = document.getElementById("tipoConsulta").value;
  const termo = document.getElementById("termoBusca").value;
  const resultadoDiv = document.getElementById("resultadoConsulta");
  resultadoDiv.innerHTML = "";

  let encontrado = false;

  matriz.forEach(item => {
    let campo = item[parseInt(tipo)];
    if (campo && campo.toLowerCase() === termo.toLowerCase()) {
      resultadoDiv.innerHTML += `
        <p><strong>IdBem:</strong> ${item[0]}</p>
        <p><strong>Nome:</strong> ${item[1]}</p>
        <p><strong>Data de Aquisição:</strong> ${item[2]}</p>
        <p><strong>Valor:</strong> ${item[3]}</p>
        <p><strong>Setor:</strong> ${item[4]}</p>
        <p><strong>Responsável:</strong> ${item[5]}</p>
        <p><strong>Casa:</strong> ${item[6]}</p>
        <hr>
      `;
      encontrado = true;
    }
  });

  if (!encontrado) {
    resultadoDiv.innerHTML = "<p>Nenhum bem encontrado com o termo de busca fornecido.</p>";
  }
}

function encerrarSessao() {
  location.reload();
}
