/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/GUIForms/JPanel.java to edit this template
 */
package proyecto.serviciopasantias.Vista.Menu_Estudiante;

import proyecto.serviciopasantias.Vista.Login;

/**
 *
 * @author Windows
 */
public class InformacionPasantiaEstudiante extends javax.swing.JPanel {

    /**
     * Creates new form InformacionPersonal
     */
    public InformacionPasantiaEstudiante() {
        initComponents();
    }

    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jPanel1 = new javax.swing.JPanel();
        jLabel11 = new javax.swing.JLabel();
        jLabel12 = new javax.swing.JLabel();
        jPanel2 = new javax.swing.JPanel();
        Boton_Editar = new javax.swing.JLabel();
        jLabel25 = new javax.swing.JLabel();
        jPanel4 = new javax.swing.JPanel();
        jLabel22 = new javax.swing.JLabel();
        jPanel5 = new javax.swing.JPanel();
        jLabel21 = new javax.swing.JLabel();
        jPanel6 = new javax.swing.JPanel();
        jLabel23 = new javax.swing.JLabel();
        Img_atras = new javax.swing.JLabel();

        setPreferredSize(new java.awt.Dimension(1150, 420));

        jPanel1.setLayout(null);

        jLabel11.setFont(new java.awt.Font("Tw Cen MT", 0, 24)); // NOI18N
        jLabel11.setText("Duración:");
        jPanel1.add(jLabel11);
        jLabel11.setBounds(40, 120, 100, 30);

        jLabel12.setFont(new java.awt.Font("Tw Cen MT", 0, 24)); // NOI18N
        jLabel12.setText("Descripción:");
        jPanel1.add(jLabel12);
        jLabel12.setBounds(40, 180, 120, 30);

        jPanel2.setBackground(new java.awt.Color(148, 180, 59));
        jPanel2.setLayout(null);

        Boton_Editar.setFont(new java.awt.Font("Tw Cen MT", 0, 24)); // NOI18N
        Boton_Editar.setHorizontalAlignment(javax.swing.SwingConstants.CENTER);
        Boton_Editar.setText("Aplicar");
        jPanel2.add(Boton_Editar);
        Boton_Editar.setBounds(0, 0, 140, 60);

        jPanel1.add(jPanel2);
        jPanel2.setBounds(990, 330, 140, 60);

        jLabel25.setFont(new java.awt.Font("Tw Cen MT", 0, 24)); // NOI18N
        jLabel25.setText("Empresa Encargada:");
        jPanel1.add(jLabel25);
        jLabel25.setBounds(40, 70, 220, 30);

        jPanel4.setBackground(new java.awt.Color(204, 204, 204));
        jPanel4.setLayout(null);

        jLabel22.setBackground(new java.awt.Color(153, 153, 153));
        jLabel22.setFont(new java.awt.Font("Tw Cen MT", 0, 24)); // NOI18N
        jLabel22.setText("Vick Industries");
        jPanel4.add(jLabel22);
        jLabel22.setBounds(0, 0, 680, 30);

        jPanel1.add(jPanel4);
        jPanel4.setBounds(260, 70, 680, 30);

        jPanel5.setBackground(new java.awt.Color(204, 204, 204));
        jPanel5.setLayout(null);

        jLabel21.setBackground(new java.awt.Color(153, 153, 153));
        jLabel21.setFont(new java.awt.Font("Tw Cen MT", 0, 24)); // NOI18N
        jLabel21.setHorizontalAlignment(javax.swing.SwingConstants.CENTER);
        jLabel21.setText("Un trabajo de mierda, mal pagado ");
        jPanel5.add(jLabel21);
        jLabel21.setBounds(0, 0, 680, 200);

        jPanel1.add(jPanel5);
        jPanel5.setBounds(260, 190, 680, 200);

        jPanel6.setBackground(new java.awt.Color(204, 204, 204));
        jPanel6.setLayout(null);

        jLabel23.setBackground(new java.awt.Color(153, 153, 153));
        jLabel23.setFont(new java.awt.Font("Tw Cen MT", 0, 24)); // NOI18N
        jLabel23.setText("16 Semanas (18 de agosto de 2022 - 21 de diciembre de 2022)");
        jPanel6.add(jLabel23);
        jLabel23.setBounds(0, 0, 650, 30);

        jPanel1.add(jPanel6);
        jPanel6.setBounds(260, 120, 680, 30);

        Img_atras.setHorizontalAlignment(javax.swing.SwingConstants.CENTER);
        Img_atras.setIcon(new javax.swing.ImageIcon(getClass().getResource("/proyecto/serviciopasantias/Vista/Images/Atras.png"))); // NOI18N
        Img_atras.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                Img_atrasMouseClicked(evt);
            }
        });
        jPanel1.add(Img_atras);
        Img_atras.setBounds(20, 10, 33, 33);

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(this);
        this.setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jPanel1, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jPanel1, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
        );
    }// </editor-fold>//GEN-END:initComponents

    private void Img_atrasMouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_Img_atrasMouseClicked
        Login b = new Login();
        b.setVisible(true);
        this.setVisible(false);
    }//GEN-LAST:event_Img_atrasMouseClicked


    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JLabel Boton_Editar;
    private javax.swing.JLabel Img_atras;
    private javax.swing.JLabel jLabel11;
    private javax.swing.JLabel jLabel12;
    private javax.swing.JLabel jLabel21;
    private javax.swing.JLabel jLabel22;
    private javax.swing.JLabel jLabel23;
    private javax.swing.JLabel jLabel25;
    private javax.swing.JPanel jPanel1;
    private javax.swing.JPanel jPanel2;
    private javax.swing.JPanel jPanel4;
    private javax.swing.JPanel jPanel5;
    private javax.swing.JPanel jPanel6;
    // End of variables declaration//GEN-END:variables
}