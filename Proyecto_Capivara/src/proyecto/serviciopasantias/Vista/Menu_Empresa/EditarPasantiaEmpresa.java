/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/GUIForms/JPanel.java to edit this template
 */
package proyecto.serviciopasantias.Vista.Menu_Empresa;

import proyecto.serviciopasantias.Vista.Menu_Estudiante.*;

/**
 *
 * @author Windows
 */
public class EditarPasantiaEmpresa extends javax.swing.JPanel {

    /**
     * Creates new form InformacionPersonal
     */
    public EditarPasantiaEmpresa() {
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
        jLabel12 = new javax.swing.JLabel();
        jLabel25 = new javax.swing.JLabel();
        jLabel13 = new javax.swing.JLabel();
        jLabel14 = new javax.swing.JLabel();
        jComboBox3 = new javax.swing.JComboBox<>();
        jComboBox5 = new javax.swing.JComboBox<>();
        jTextField5 = new javax.swing.JTextField();
        jTextField6 = new javax.swing.JTextField();
        Img_atras = new javax.swing.JLabel();
        jPanel10 = new javax.swing.JPanel();
        jPanel11 = new javax.swing.JPanel();
        Boton_Guardar = new javax.swing.JLabel();

        setPreferredSize(new java.awt.Dimension(1150, 420));

        jPanel1.setLayout(null);

        jLabel12.setFont(new java.awt.Font("Tw Cen MT", 0, 24)); // NOI18N
        jLabel12.setText("Ubicación:");
        jPanel1.add(jLabel12);
        jLabel12.setBounds(70, 200, 120, 30);

        jLabel25.setFont(new java.awt.Font("Tw Cen MT", 0, 24)); // NOI18N
        jLabel25.setText("Tipologia:");
        jPanel1.add(jLabel25);
        jLabel25.setBounds(70, 60, 200, 30);

        jLabel13.setFont(new java.awt.Font("Tw Cen MT", 0, 24)); // NOI18N
        jLabel13.setText("Descripción:");
        jPanel1.add(jLabel13);
        jLabel13.setBounds(70, 260, 120, 30);

        jLabel14.setFont(new java.awt.Font("Tw Cen MT", 0, 24)); // NOI18N
        jLabel14.setText("Duración:");
        jPanel1.add(jLabel14);
        jLabel14.setBounds(70, 130, 120, 30);

        jComboBox3.setBackground(new java.awt.Color(204, 204, 204));
        jComboBox3.setFont(new java.awt.Font("Arial", 0, 16)); // NOI18N
        jComboBox3.setModel(new javax.swing.DefaultComboBoxModel<>(new String[] { " ", "Pasantia", "Practica"}));
        jComboBox3.setBorder(javax.swing.BorderFactory.createLineBorder(new java.awt.Color(0, 0, 0)));
        jComboBox3.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jComboBox3ActionPerformed(evt);
            }
        });
        jPanel1.add(jComboBox3);
        jComboBox3.setBounds(360, 70, 420, 20);

        jComboBox5.setBackground(new java.awt.Color(204, 204, 204));
        jComboBox5.setFont(new java.awt.Font("Arial", 0, 16)); // NOI18N
        jComboBox5.setModel(new javax.swing.DefaultComboBoxModel<>(new String[] { " " ,"Bogota", "Medellin", "Orinoquia", "Palmira","Manizales","Tumaco"}));
        jComboBox5.setBorder(javax.swing.BorderFactory.createLineBorder(new java.awt.Color(0, 0, 0)));
        jComboBox5.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jComboBox5ActionPerformed(evt);
            }
        });
        jPanel1.add(jComboBox5);
        jComboBox5.setBounds(360, 210, 420, 20);

        jTextField5.setBackground(new java.awt.Color(204, 204, 204));
        jTextField5.setFont(new java.awt.Font("Arial", 0, 16)); // NOI18N
        jTextField5.setBorder(javax.swing.BorderFactory.createLineBorder(new java.awt.Color(0, 0, 0)));
        jTextField5.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jTextField5ActionPerformed(evt);
            }
        });
        jPanel1.add(jTextField5);
        jTextField5.setBounds(360, 140, 420, 20);

        jTextField6.setBackground(new java.awt.Color(204, 204, 204));
        jTextField6.setFont(new java.awt.Font("Arial", 0, 16)); // NOI18N
        jTextField6.setBorder(javax.swing.BorderFactory.createLineBorder(new java.awt.Color(0, 0, 0)));
        jTextField6.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jTextField6ActionPerformed(evt);
            }
        });
        jPanel1.add(jTextField6);
        jTextField6.setBounds(360, 270, 420, 120);

        Img_atras.setHorizontalAlignment(javax.swing.SwingConstants.CENTER);
        Img_atras.setIcon(new javax.swing.ImageIcon(getClass().getResource("/proyecto/serviciopasantias/Vista/Images/Atras.png"))); // NOI18N
        Img_atras.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                Img_atrasMouseClicked(evt);
            }
        });
        jPanel1.add(Img_atras);
        Img_atras.setBounds(10, 10, 33, 33);

        jPanel10.setBackground(new java.awt.Color(204, 204, 204));
        jPanel10.setLayout(null);

        jPanel11.setBackground(new java.awt.Color(148, 180, 59));
        jPanel11.setLayout(null);

        Boton_Guardar.setBackground(new java.awt.Color(153, 153, 153));
        Boton_Guardar.setFont(new java.awt.Font("Tw Cen MT", 0, 24)); // NOI18N
        Boton_Guardar.setHorizontalAlignment(javax.swing.SwingConstants.CENTER);
        Boton_Guardar.setText("Guardar");
        jPanel11.add(Boton_Guardar);
        Boton_Guardar.setBounds(0, 0, 210, 50);

        jPanel10.add(jPanel11);
        jPanel11.setBounds(10, 10, 210, 50);

        jPanel1.add(jPanel10);
        jPanel10.setBounds(870, 330, 230, 70);

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

    private void jComboBox3ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jComboBox3ActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_jComboBox3ActionPerformed

    private void jComboBox5ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jComboBox5ActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_jComboBox5ActionPerformed

    private void jTextField5ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jTextField5ActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_jTextField5ActionPerformed

    private void jTextField6ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jTextField6ActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_jTextField6ActionPerformed

    private void Img_atrasMouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_Img_atrasMouseClicked
        
    }//GEN-LAST:event_Img_atrasMouseClicked


    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JLabel Boton_Guardar;
    private javax.swing.JLabel Img_atras;
    private javax.swing.JComboBox<String> jComboBox3;
    private javax.swing.JComboBox<String> jComboBox5;
    private javax.swing.JLabel jLabel12;
    private javax.swing.JLabel jLabel13;
    private javax.swing.JLabel jLabel14;
    private javax.swing.JLabel jLabel25;
    private javax.swing.JPanel jPanel1;
    private javax.swing.JPanel jPanel10;
    private javax.swing.JPanel jPanel11;
    private javax.swing.JTextField jTextField5;
    private javax.swing.JTextField jTextField6;
    // End of variables declaration//GEN-END:variables
}
