/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/GUIForms/JFrame.java to edit this template
 */
package proyecto.serviciopasantias.Vista;

import java.awt.BorderLayout;

/**
 *
 * @author Windows
 */
public class RegistroUser extends javax.swing.JFrame {

    /**
     * Creates new form RegistroUser
     */
    public RegistroUser() {
        initComponents();
        this.setLocationRelativeTo(null);
        
        
    }

    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        Fondo = new javax.swing.JPanel();
        Barra_Sup = new javax.swing.JPanel();
        Escudo_Nacional = new javax.swing.JLabel();
        Img_atras = new javax.swing.JLabel();
        jLabel10 = new javax.swing.JLabel();
        jPanel1 = new javax.swing.JPanel();
        jLabel2 = new javax.swing.JLabel();
        jSeparator2 = new javax.swing.JSeparator();
        jLabel3 = new javax.swing.JLabel();
        Fondo_Roles = new javax.swing.JPanel();
        jSeparator1 = new javax.swing.JSeparator();
        Boton_Usuario = new javax.swing.JPanel();
        jLabel4 = new javax.swing.JLabel();
        jLabel8 = new javax.swing.JLabel();
        jSeparator3 = new javax.swing.JSeparator();
        Boton_Docente = new javax.swing.JPanel();
        jLabel5 = new javax.swing.JLabel();
        jLabel7 = new javax.swing.JLabel();
        jSeparator4 = new javax.swing.JSeparator();
        Boton_Empresa = new javax.swing.JPanel();
        jLabel6 = new javax.swing.JLabel();
        jLabel9 = new javax.swing.JLabel();
        Boton_Usuario2 = new javax.swing.JPanel();
        Panel_Contenido = new javax.swing.JPanel();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);
        setResizable(false);

        Fondo.setBackground(new java.awt.Color(148, 180, 59));
        Fondo.setLayout(null);

        Barra_Sup.setBackground(new java.awt.Color(86, 90, 92));
        Barra_Sup.setLayout(null);

        Escudo_Nacional.setIcon(new javax.swing.ImageIcon(getClass().getResource("/proyecto/serviciopasantias/Vista/Images/LogoUN.png"))); // NOI18N
        Barra_Sup.add(Escudo_Nacional);
        Escudo_Nacional.setBounds(1129, 0, 214, 90);

        Img_atras.setHorizontalAlignment(javax.swing.SwingConstants.CENTER);
        Img_atras.setIcon(new javax.swing.ImageIcon(getClass().getResource("/proyecto/serviciopasantias/Vista/Images/Atras.png"))); // NOI18N
        Img_atras.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                Img_atrasMouseClicked(evt);
            }
        });
        Barra_Sup.add(Img_atras);
        Img_atras.setBounds(19, 14, 55, 54);

        jLabel10.setFont(new java.awt.Font("Tw Cen MT", 1, 48)); // NOI18N
        jLabel10.setForeground(new java.awt.Color(255, 255, 255));
        jLabel10.setHorizontalAlignment(javax.swing.SwingConstants.CENTER);
        jLabel10.setText("Servicio de pasantias");
        jLabel10.setToolTipText("");
        Barra_Sup.add(jLabel10);
        jLabel10.setBounds(0, 0, 1370, 90);

        Fondo.add(Barra_Sup);
        Barra_Sup.setBounds(0, 0, 1570, 90);

        jPanel1.setBackground(new java.awt.Color(86, 90, 92));
        jPanel1.setLayout(null);

        jLabel2.setFont(new java.awt.Font("Tw Cen MT", 1, 48)); // NOI18N
        jLabel2.setForeground(new java.awt.Color(255, 255, 255));
        jLabel2.setHorizontalAlignment(javax.swing.SwingConstants.CENTER);
        jLabel2.setText("Registro");
        jPanel1.add(jLabel2);
        jLabel2.setBounds(0, 0, 1170, 80);

        jSeparator2.setBackground(new java.awt.Color(255, 255, 255));
        jSeparator2.setForeground(new java.awt.Color(255, 255, 255));
        jPanel1.add(jSeparator2);
        jSeparator2.setBounds(0, 80, 1324, 14);

        jLabel3.setFont(new java.awt.Font("Tw Cen MT", 0, 18)); // NOI18N
        jLabel3.setForeground(new java.awt.Color(255, 255, 255));
        jLabel3.setText("Seleccione su Rol");
        jPanel1.add(jLabel3);
        jLabel3.setBounds(50, 90, 140, 21);

        Fondo_Roles.setBackground(new java.awt.Color(114, 137, 48));
        Fondo_Roles.setLayout(null);

        jSeparator1.setBackground(new java.awt.Color(255, 255, 255));
        jSeparator1.setForeground(new java.awt.Color(255, 255, 255));
        Fondo_Roles.add(jSeparator1);
        jSeparator1.setBounds(-10, 40, 250, 14);

        Boton_Usuario.setBackground(new java.awt.Color(114, 137, 48));
        Boton_Usuario.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                Boton_UsuarioMouseClicked(evt);
            }
        });
        Boton_Usuario.setLayout(null);

        jLabel4.setFont(new java.awt.Font("Tw Cen MT", 0, 24)); // NOI18N
        jLabel4.setText("Estudiante");
        Boton_Usuario.add(jLabel4);
        jLabel4.setBounds(120, 120, 110, 27);

        jLabel8.setIcon(new javax.swing.ImageIcon(getClass().getResource("/proyecto/serviciopasantias/Vista/Images/Estudiante.png"))); // NOI18N
        jLabel8.setText("jLabel8");
        Boton_Usuario.add(jLabel8);
        jLabel8.setBounds(20, 0, 100, 140);

        Fondo_Roles.add(Boton_Usuario);
        Boton_Usuario.setBounds(0, 40, 230, 165);

        jSeparator3.setBackground(new java.awt.Color(255, 255, 255));
        jSeparator3.setForeground(new java.awt.Color(255, 255, 255));
        Fondo_Roles.add(jSeparator3);
        jSeparator3.setBounds(0, 370, 250, 14);

        Boton_Docente.setBackground(new java.awt.Color(114, 137, 48));
        Boton_Docente.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                Boton_DocenteMouseClicked(evt);
            }
        });
        Boton_Docente.setLayout(null);

        jLabel5.setFont(new java.awt.Font("Tw Cen MT", 0, 24)); // NOI18N
        jLabel5.setText("Docente");
        Boton_Docente.add(jLabel5);
        jLabel5.setBounds(130, 130, 80, 16);

        jLabel7.setIcon(new javax.swing.ImageIcon(getClass().getResource("/proyecto/serviciopasantias/Vista/Images/Profesor.png"))); // NOI18N
        jLabel7.setText("jLabel7");
        Boton_Docente.add(jLabel7);
        jLabel7.setBounds(10, 10, 150, 110);

        jSeparator4.setBackground(new java.awt.Color(255, 255, 255));
        jSeparator4.setForeground(new java.awt.Color(255, 255, 255));
        Boton_Docente.add(jSeparator4);
        jSeparator4.setBounds(0, 0, 250, 14);

        Fondo_Roles.add(Boton_Docente);
        Boton_Docente.setBounds(0, 205, 230, 165);

        Boton_Empresa.setBackground(new java.awt.Color(114, 137, 48));
        Boton_Empresa.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                Boton_EmpresaMouseClicked(evt);
            }
        });
        Boton_Empresa.setLayout(null);

        jLabel6.setFont(new java.awt.Font("Tw Cen MT", 0, 24)); // NOI18N
        jLabel6.setText("Empresa");
        Boton_Empresa.add(jLabel6);
        jLabel6.setBounds(130, 120, 100, 27);

        jLabel9.setIcon(new javax.swing.ImageIcon(getClass().getResource("/proyecto/serviciopasantias/Vista/Images/Empresa.png"))); // NOI18N
        Boton_Empresa.add(jLabel9);
        jLabel9.setBounds(30, 10, 130, 110);

        Fondo_Roles.add(Boton_Empresa);
        Boton_Empresa.setBounds(0, 375, 230, 165);

        jPanel1.add(Fondo_Roles);
        Fondo_Roles.setBounds(0, 80, 230, 540);

        Boton_Usuario2.setBackground(new java.awt.Color(114, 137, 48));
        Boton_Usuario2.setLayout(null);
        jPanel1.add(Boton_Usuario2);
        Boton_Usuario2.setBounds(0, 200, 230, 160);

        Panel_Contenido.setBackground(new java.awt.Color(86, 90, 92));
        Panel_Contenido.setBorder(javax.swing.BorderFactory.createLineBorder(new java.awt.Color(0, 0, 0)));

        javax.swing.GroupLayout Panel_ContenidoLayout = new javax.swing.GroupLayout(Panel_Contenido);
        Panel_Contenido.setLayout(Panel_ContenidoLayout);
        Panel_ContenidoLayout.setHorizontalGroup(
            Panel_ContenidoLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 938, Short.MAX_VALUE)
        );
        Panel_ContenidoLayout.setVerticalGroup(
            Panel_ContenidoLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 538, Short.MAX_VALUE)
        );

        jPanel1.add(Panel_Contenido);
        Panel_Contenido.setBounds(230, 80, 940, 540);

        Fondo.add(jPanel1);
        jPanel1.setBounds(100, 120, 1170, 620);

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(Fondo, javax.swing.GroupLayout.DEFAULT_SIZE, 1366, Short.MAX_VALUE)
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addComponent(Fondo, javax.swing.GroupLayout.PREFERRED_SIZE, 768, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(0, 0, Short.MAX_VALUE))
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void Boton_UsuarioMouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_Boton_UsuarioMouseClicked
        
        RegistroEstudiantes p1 = new RegistroEstudiantes();
        p1.setSize(940,540);
        p1.setLocation(0,0);
        
        Panel_Contenido.removeAll();
        Panel_Contenido.add(p1,BorderLayout.CENTER);
        Panel_Contenido.revalidate();
        Panel_Contenido.repaint(); 
        
        
        
    }//GEN-LAST:event_Boton_UsuarioMouseClicked

    private void Boton_DocenteMouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_Boton_DocenteMouseClicked
        RegistroDocente p2 = new RegistroDocente();
        p2.setSize(940,540);
        p2.setLocation(0,0);
        
        Panel_Contenido.removeAll();
        Panel_Contenido.add(p2,BorderLayout.CENTER);
        Panel_Contenido.revalidate();
        Panel_Contenido.repaint(); 
    }//GEN-LAST:event_Boton_DocenteMouseClicked

    private void Boton_EmpresaMouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_Boton_EmpresaMouseClicked
        RegistroEmpresas p3 = new RegistroEmpresas();
        p3.setSize(940,540);
        p3.setLocation(0,0);
        
        Panel_Contenido.removeAll();
        Panel_Contenido.add(p3,BorderLayout.CENTER);
        Panel_Contenido.revalidate();
        Panel_Contenido.repaint(); 
    }//GEN-LAST:event_Boton_EmpresaMouseClicked

    private void Img_atrasMouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_Img_atrasMouseClicked
        Login b = new Login();
        b.setVisible(true);  
        this.dispose();
    }//GEN-LAST:event_Img_atrasMouseClicked

    /**
     * @param args the command line arguments
     */

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JPanel Barra_Sup;
    private javax.swing.JPanel Boton_Docente;
    private javax.swing.JPanel Boton_Empresa;
    private javax.swing.JPanel Boton_Usuario;
    private javax.swing.JPanel Boton_Usuario2;
    private javax.swing.JLabel Escudo_Nacional;
    private javax.swing.JPanel Fondo;
    private javax.swing.JPanel Fondo_Roles;
    private javax.swing.JLabel Img_atras;
    private javax.swing.JPanel Panel_Contenido;
    private javax.swing.JLabel jLabel10;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel jLabel3;
    private javax.swing.JLabel jLabel4;
    private javax.swing.JLabel jLabel5;
    private javax.swing.JLabel jLabel6;
    private javax.swing.JLabel jLabel7;
    private javax.swing.JLabel jLabel8;
    private javax.swing.JLabel jLabel9;
    private javax.swing.JPanel jPanel1;
    private javax.swing.JSeparator jSeparator1;
    private javax.swing.JSeparator jSeparator2;
    private javax.swing.JSeparator jSeparator3;
    private javax.swing.JSeparator jSeparator4;
    // End of variables declaration//GEN-END:variables
}