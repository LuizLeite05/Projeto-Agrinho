document
  .getElementById('loginForm')
  .addEventListener('submit', function (event) {
    event.preventDefault()

    // Variáveis com as credenciais corretas
    const validEmail = 'joaovictor@gmail.com'
    const validPassword = 'senha123'

    // Obtém os valores inseridos pelo usuário
    const email = document.getElementById('email').value
    const password = document.getElementById('password').value

    // Verifica as credenciais
    if (email === validEmail && password === validPassword) {
      // Redireciona para a página homePage.html
      window.location.href = 'homePage.html'
    } else {
      // Exibe um alerta de senha inválida
      alert(
        'Email ou senha inválidos. Por favor, digite as credenciais corretas.'
      )
    }
  })
