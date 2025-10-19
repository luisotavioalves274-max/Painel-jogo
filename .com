<!DOCTYPE html>
<html lang="pt-br">
<head>
  <meta charset="UTF-8">
  <title>Painel do Jogo</title>
  <style>
    body {
      background-color: #111;
      color: #fff;
      font-family: Arial, sans-serif;
    }
    .hud {
      position: fixed;
      top: 20px;
      left: 20px;
      background: rgba(0,0,0,0.6);
      padding: 15px;
      border-radius: 10px;
      width: 220px;
    }
    .hud h2 {
      margin-top: 0;
      font-size: 18px;
    }
    .hud button {
      margin-top: 10px;
      padding: 8px;
      background-color: #444;
      color: #fff;
      border: none;
      border-radius: 5px;
      cursor: pointer;
    }
    .hud button:hover {
      background-color: #666;
    }
  </style>
</head>
<body>
  <div class="hud">
    <h2>Painel do Jogador</h2>
    <p>Vida: <span id="vida">100</span></p>
    <p>Munição: <span id="municao">30</span></p>
    <p>Posição: <span id="posicao">X:0 Y:0 Z:0</span></p>
    <button onclick="recarregar()">Recarregar</button>
  </div>

  <script>
    let vida = 100;
    let municao = 30;

    function atualizarPosicao() {
      const x = (Math.random() * 100).toFixed(1);
      const y = (Math.random() * 100).toFixed(1);
      const z = (Math.random() * 100).toFixed(1);
      document.getElementById("posicao").textContent = `X:${x} Y:${y} Z:${z}`;
    }

    function recarregar() {
      municao = 30;
      document.getElementById("municao").textContent = municao;
      alert("Recarregado!");
    }

    setInterval(atualizarPosicao, 1000);
  </script>
</body>
</html>
