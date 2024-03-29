<%@page  language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html lang="pt-br">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Financeiro - UFF - Conta Corrent</title>

    <!-- Fontes personalizados para o template -->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Estilos personalizados para o template -->
    <link href="css/financeiro.css" rel="stylesheet">

    <!-- Estilos personalizados para esta página -->
    <link href="vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
    <link rel="shortcut icon" href="img/favicon.ico" type="image/x-icon">    
</head>

<body id="page-top">

    <!-- Container principal da página -->
    <div id="wrapper">

       <!-- Barra de menu lateral -->      
        <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">
            <!-- Barra lateral - Logo Uff -->
            <a class="sidebar-brand d-flex align-items-center justify-content-center" href="home.jsp">
                <div class="sidebar-brand-icon">
                    <img src="img/logouffbranco.png" alt="Logo UFF" width="50" height="50">
                </div>
            </a>

            <!-- Divisor -->
            <hr class="sidebar-divider my-0">

            <!-- Item em negrito - Painel de controle -->
            <li class="nav-item active">
                <a class="nav-link" href="home.jsp">
                    <i class="fas fa-tasks"></i>
                    <span>Painel de Controle</span></a>
            </li>

            <!-- Divisor -->
            <hr class="sidebar-divider">

        <!-- Menu Admin -->
        <div id="gerenciamentoadmin" style="${adm}">
        <div class="sidebar-heading">
            Área Admin
        </div>
            <li class="nav-item">
                <a class="nav-link" href="${pageContext.request.contextPath}/CategoriaController?action=listcateogoria">
                    <i class="fas fa-sitemap"></i>
                    <span>Categorias</span></a>
            </li>

            <!-- Item de navegação - Funcionalidades do menu colapsado -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUtilities"
                    aria-expanded="true" aria-controls="collapseUtilities">
                    <i class="fas fa-fw fa-wrench"></i>
                    <span>Gerenciar Acessos</span>
                </a>
                <div id="collapseUtilities" class="collapse" aria-labelledby="headingUtilities"
                    data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">Gerenciamentos</h6>
                        <a class="collapse-item" href="${pageContext.request.contextPath}/UsuarioController?action=listusuario">Usuários</a>      
                       <a class="collapse-item" href="${pageContext.request.contextPath}/AdminController?action=listadmin">Administradores</a>                                
                    </div>
                </div>
            </li>
            <!-- Divisor -->
            <hr class="sidebar-divider">
        </div>
                    
            <!-- Cabeçalho -->
            <div id="menuusuario" style="${usu}">
                <div class="sidebar-heading">               
                    <span>Gerenciar Conta</span>
                </div>            

                 <!-- Nav Item - Conta corrente -->
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/ContaController?action=listconta&id=${sessionScope.idUsuarioLogado}&session=${sessionScope.usuarioLogado.nome}">
                        <i class="fas fa-university"></i>
                        <span>Conta Corrente</span></a>
                </li>

               <!-- Nav Item - Lançamentos -->
                <li class="nav-item">
                     <a class="nav-link" href="${pageContext.request.contextPath}/LancamentoController?action=listLancamento&id=${sessionScope.idUsuarioLogado}&session=${sessionScope.usuarioLogado.nome}">            
                        <i class="fas fa-file-invoice-dollar"></i>
                        <span>Lançamentos</span>
                     </a>
                </li>

                <!-- Divisor -->
                <hr class="sidebar-divider d-none d-md-block">
            </div> 

           <!-- Botao para recolher menu lateal -->
            <div class="text-center d-none d-md-inline">
                <button class="rounded-circle border-0" id="sidebarToggle"></button>
            </div>

        </ul>
        <!-- Fim da barra lateral -->

        <!-- Conteuúdo do container -->
        <div id="content-wrapper" class="d-flex flex-column">
            <!-- Conteúdo principal -->
            <div id="content">
                <!-- Barra superior -->
                <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">
                    <!-- Alternância da barra lateral (Barra superior) -->
                    <form class="form-inline">
                        <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                            <i class="fa fa-bars"></i>
                        </button>
                    </form>                    

                    <!-- Barra superior - Menu do usuário -->
                    <ul class="navbar-nav ml-auto">       
                        <div class="topbar-divider d-none d-sm-block"></div>

                        <!-- Item de navegação - Informações do usuário -->
                        <li class="nav-item dropdown no-arrow">
                            <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
                                    data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <span class="mr-2 d-none d-lg-inline text-gray-600 small">${sessionScope.usuarioLogado.nome}</span>
                                    <img class="img-profile rounded-circle"
                                        src="img/undraw_profile.svg">
                            </a>
                            <!-- Dropdown - Informações do usuário -->
                            <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                aria-labelledby="userDropdown">
                                <a class="dropdown-item"  id="perfil" href="#" data-toggle="modal" data-target="#perfilModal">
                                    <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                                    Perfil
                                </a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item"  id="sair" href="#" data-toggle="modal" data-target="#logoutModal">
                                    <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                                    Sair
                                </a>
                            </div>
                        </li>
                    </ul>

                </nav>
                <!-- Fim da barra superior  -->

                <!-- Inicio do conteúdo da página -->
                <div class="container-fluid">

                    <div class="row">
                        <div class="col-md-11">
                            <h1 class="h3 mb-2 text-gray-800">Gerenciamento de Contas Correntes</h1>
                            <p class="mb-4">Área para gerenciamento das contas do usuário do sistema.</p> 
                        </div>
                        <div class="col-md-1">
                             <a href="#" onclick="carregarDadosEdicao('contasModalLabel', 'novo', 'Conta Corrente',  ['agencia', 'cc', 'descricao', 'bancos'], [ '<c:out value='${conta.agencia}'/>', '<c:out value='${conta.numeroConta}'/>', '<c:out value='${conta.descricao}'/>', '<c:out value='${conta.banco}'/>',])" data-toggle="modal" data-target="#contasModal">
                                <i class="fas fa-4x fa-plus-circle"></i>                         
                            </a>
                            Adicionar
                        </div>                                             
                    </div>

                    <!-- Tabela  -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">Gerenciar Conta > Conta Corrente</h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered table-hover" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th>Id</th>
                                            <th>Descrição</th>
                                            <th>Banco</th>
                                            <th>Agência</th>
                                            <th>Nº Conta</th>  
                                            <th></th>               
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th>Id</th>
                                            <th>Descrição</th>
                                            <th>Banco</th>
                                            <th>Agência</th>
                                            <th>Nº Conta</th>  
                                            <th></th>                                          
                                        </tr>
                                    </tfoot>
                                   <tbody>                                       
                                        <c:forEach items="${contas}" var="conta">
                                                <tr>                                                         
                                                    <td><c:out value="${conta.id}" /></td>   
                                                    <td><c:out value="${conta.descricao}" /></td>  
                                                    <td><c:out value="${conta.banco}" /></td> 
                                                    <td><c:out value="${conta.agencia}" /></td>                                                
                                                    <td><c:out value="${conta.numeroConta}" /></td>  
                                                    <td> 
                                                        <div class="text-center">
                                                                <a href="#" onclick="carregarDadosEdicao('contasModalLabel', 'edit', 'Conta Corrente',  ['id_conta', 'agencia', 'cc', 'descricao', 'bancos'], [ '<c:out value='${conta.id}'/>', '<c:out value='${conta.agencia}'/>', '<c:out value='${conta.numeroConta}'/>', '<c:out value='${conta.descricao}'/>', '<c:out value='${conta.banco}'/>',])" data-toggle="modal" data-target="#contasModal">
                                                                    <i class="fas fa-1x fa-edit pr-1"></i>                       
                                                                </a>
                                                                <a  style="display:<c:out value="${conta.possuiLancamento}" />" href="#" data-toggle="modal" onclick="carregarDadosEdicao('contaLabel', 'delete', 'Categoria', ['id_exclusao'], [ '<c:out value='${conta.id}'/>'])"   data-target="#exclusaoModal">
                                                                                <i class="fas fa-1x fa-trash-alt"></i>                    
                                                                </a>
                                                        </div>                                                           
                                                    </td>                                                  						
                                                </tr>
                                        </c:forEach>                                                                         
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /.container-fluid -->
            </div>
            <!-- Fim do conteúdo principal -->

             <!-- Footer -->
            <footer class="sticky-footer  bg-white">
                <div class="container my-auto">
                    <div class="copyright text-center my-auto">
                        <span>Copyright &copy; UFF - Universidade Federal Fluminense<br>Qualidade e Teste - 2022.2</span>
                    </div>
                </div>
            </footer>
            <!-- End of Footer -->
            
        </div>
        <!-- Fim do container do conteúdo -->
    </div>
    <!-- Fim do Container principal da página -->

    <!--Botão para rolagem para o topo -->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

    <!-- Modal de Logout-->
    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Sair</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">Tem certeza que deseja sair?</div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancelar</button>
                     <a class="btn btn-primary" href="${pageContext.request.contextPath}/AutenticacaoController?deslogar=sim">Sair</a>
                </div>
            </div>
        </div>
    </div>
    <!--Fim do Modal de Logout -->

    <!-- Modal de criação de contas -->
    <div class="modal fade" id="contasModal" tabindex="-1" role="dialog" aria-labelledby="contasModalLabel"
    aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="contasModalLabel"></h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <!-- Corpo do modal -->
                <div class="modal-body">                    
                     <form class="row g-3 needs-validation" method="post" action="${pageContext.request.contextPath}/ContaController?action=salvar&id=${sessionScope.idUsuarioLogado}">   
                        <div class="col-md-4">
                        <label for="validationCustom04" class="form-label">Banco</label>
                        <select class="form-select" name="bancos" id="bancos" required>
                            <option selected disabled value="">Selecione</option>
                            <option value="237">Bradesco</option> 
                            <option value="341">Itaú</option>
                            <option value="033">Santander</option>
                            <option value="104">Caixa Econômica</option>
                            <option value="001">Banco do Brasil</option>
                            <option value="041">Barinsul</option>
                            <option value="999">Outro</option>
                        </select>                        
                        </div>  
                        <div class="col-md-3">            
                        <input  name="id_usuario" class="form-control" type="hidden" value="${sessionScope.idUsuarioLogado}">   
                        <input  name="id_conta" class="form-control" type="hidden" value="<c:out value="${conta.id}"/>" id="id_conta"> 
                        <input  type= "hidden"  name= "url" value=<%=request.getRequestURL()%>> 
                        <label for="validacaoAgencia" class="form-label">Agência</label>
                        <input name="agencia" type="text" maxlength="6" value="<c:out value="${conta.agencia}" />" class="form-control" id="agencia" required>                        
                        </div> 
                        <div class="col-md-4">
                            <label for="validacaoCC" class="form-label">Conta Corrente</label>
                            <input name="cc" maxlength="6" type="text" value="<c:out value="${conta.numeroConta}" />" class="form-control" id="cc" required>                     
                        </div>
                        <div class="col-md-12">
                        <label for="validacaoDescricao" class="form-label">Descrição</label>
                        <input name="descricao" maxlength="20" type="text" value="<c:out value="${conta.descricao}" />" class="form-control" id="descricao" required>                                           
                        </div>
                        <div class="modal-footer">
                            <button id="gravar" class="btn btn-primary" value="Submit" type="submit">Gravar</button>
                           <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancelar</button>                    
                        </div>  
                    </form>  
                </div>
            </div>
        </div>
    </div>
    <!--Fim modal de criação de contas -->

    <!-- Modal de exclusão -->
      <div class="modal fade" id="exclusaoModal" tabindex="-1" role="dialog" aria-labelledby="exclusaoModalLabel"
      aria-hidden="true">
          <div class="modal-dialog" role="document">

                  <div class="modal-content">    
                      <form method="post" action="${pageContext.request.contextPath}/ContaController?action=delete&id=${sessionScope.idUsuarioLogado}">                            
                          <div class="modal-header">
                              <h5 class="modal-title" id="exclusaoModalLabel">Excluir Usuário</h5>
                              <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                                  <span aria-hidden="true">×</span>
                              </button>
                          </div>
                          <div class="modal-body">Tem certeza que deseja excluir?</div>
                          <input  name="id_exclusao" class="form-control" type="hidden"  value="<c:out value="${conta.id}"/>" id="id_exclusao">   
                          <div class="modal-footer">
                              <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancelar</button>
                              <button class="btn btn-primary"  value="Submit" type="submit">Confirmar</button>
                          </div>
                      </form>
                  </div>
          </div>
      </div>
      <!--Fim do Modal de exclusão --> 

    <!-- Modal de informações de usuários -->
   <div class="modal fade" id="perfilModal" tabindex="-1" role="dialog" aria-labelledby="perfilModalLabel"
   aria-hidden="true">
      <div class="modal-dialog" role="document">
          <div class="modal-content">
              <div class="modal-header">
                  <h5 class="modal-title" id="usuarioModalLabel">Informações do usuário logado</h5>
                  <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                      <span aria-hidden="true">×</span>
                  </button>
              </div>
              <!-- Corpo do modal -->
              <div class="modal-body">                    
                  <form class="row g-3 needs-validation" novalidate>
                      <div class="col-md-6">
                        <label for="nomeValicacao" class="form-label">Nome</label>
                        <label class="text-primary" for="nomeValicacao">${sessionScope.usuarioLogado.nome}</label>                          
                      </div>
                      <div class="col-md-5">
                        <label class="form-label">CPF</label>
                        <label class="text-primary" class="form-label">${sessionScope.cpf}</label>
                      </div>                     
                  </form>             
              </div>
              <div class="modal-footer">
                  <button class="btn btn-primary" type="submit" data-dismiss="modal">Ok</button>                               
              </div>                
          </div>
      </div>
  </div>
  <!--Fim modal de informações do usuario logado -->

    <!-- Javascript principal do bootstrap -->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Javascript principal do plugin -->
    <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Script personalizado para todas as páginas -->
    <script src="js/financeiro.js"></script>

    <!-- Plugins externos -->
    <script src="vendor/datatables/jquery.dataTables.js"></script>
    <script src="vendor/datatables/dataTables.bootstrap4.min.js"></script>

    <!-- Script do plugin externo -->
    <script src="js/datatables.js"></script>

</body>
</html>
