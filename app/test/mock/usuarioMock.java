package mock;

import model.Usuario;

public class usuarioMock {
    
    public usuarioMock () {
    }    
        
    // Usuário
    
    public Usuario obterUsuarioSuspenso() {
        return new Usuario("Bruno", "13676616766", "1234", "S");
    }   
    
    
    public Usuario obterUsuarioNaoSuspenso() {
        return new Usuario("Bruno", "13676616766", "1234", "N");
    }  
}
