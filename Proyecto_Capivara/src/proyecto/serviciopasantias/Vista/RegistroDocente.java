/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/GUIForms/JPanel.java to edit this template
 */
package proyecto.serviciopasantias.Vista;

import java.awt.event.KeyEvent;
import javax.swing.JOptionPane;
import proyecto.serviciopasantias.Modelo.Docentes;

/**
 *
 * @author snsc2
 */
public class RegistroDocente extends javax.swing.JPanel {
    /**
     * Creates new form RegistroEstudiantes
     */
    public RegistroDocente() {
        initComponents();
        A1.setVisible(false);
        A2.setVisible(false);
        A3.setVisible(false);
        A4.setVisible(false);
        A5.setVisible(false);
        A6.setVisible(false);
        A7.setVisible(false);
        A8.setVisible(false);
        A9.setVisible(false);
        A10.setVisible(false);
        A11.setVisible(false);
    }

    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jPanel4 = new javax.swing.JPanel();
        Boton_Registrar = new javax.swing.JPanel();
        jLabel21 = new javax.swing.JLabel();
        jSeparator1 = new javax.swing.JSeparator();
        A3 = new javax.swing.JLabel();
        A1 = new javax.swing.JLabel();
        A2 = new javax.swing.JLabel();
        A8 = new javax.swing.JLabel();
        A4 = new javax.swing.JLabel();
        A5 = new javax.swing.JLabel();
        A6 = new javax.swing.JLabel();
        A7 = new javax.swing.JLabel();
        A9 = new javax.swing.JLabel();
        A10 = new javax.swing.JLabel();
        A11 = new javax.swing.JLabel();
        NombreEntry = new javax.swing.JTextField();
        jLabel8 = new javax.swing.JLabel();
        jLabel9 = new javax.swing.JLabel();
        ApellidoEntry = new javax.swing.JTextField();
        jLabel10 = new javax.swing.JLabel();
        IDCombo = new javax.swing.JComboBox<>();
        jLabel17 = new javax.swing.JLabel();
        LugarCombo = new javax.swing.JComboBox<>();
        IDEntry = new javax.swing.JTextField();
        TelefonoEntry = new javax.swing.JTextField();
        jLabel7 = new javax.swing.JLabel();
        jLabel20 = new javax.swing.JLabel();
        jLabel14 = new javax.swing.JLabel();
        CorreoEntry = new javax.swing.JTextField();
        SedeCombo = new javax.swing.JComboBox<>();
        jLabel13 = new javax.swing.JLabel();
        jLabel12 = new javax.swing.JLabel();
        FacultadCombo = new javax.swing.JComboBox<>();
        jLabel16 = new javax.swing.JLabel();
        DepartamentoCombo = new javax.swing.JComboBox<>();

        jPanel4.setBackground(new java.awt.Color(236, 234, 234));
        jPanel4.setLayout(null);

        Boton_Registrar.setBackground(new java.awt.Color(148, 180, 59));
        Boton_Registrar.setBorder(javax.swing.BorderFactory.createLineBorder(new java.awt.Color(0, 0, 0), 2));
        Boton_Registrar.setFont(new java.awt.Font("Arial", 0, 12)); // NOI18N
        Boton_Registrar.setLayout(null);

        jLabel21.setFont(new java.awt.Font("Arial", 0, 24)); // NOI18N
        jLabel21.setHorizontalAlignment(javax.swing.SwingConstants.CENTER);
        jLabel21.setText("Registrar");
        jLabel21.setNextFocusableComponent(NombreEntry);
        jLabel21.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                jLabel21MouseClicked(evt);
            }
        });
        jLabel21.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyPressed(java.awt.event.KeyEvent evt) {
                jLabel21KeyPressed(evt);
            }
        });
        Boton_Registrar.add(jLabel21);
        jLabel21.setBounds(0, 0, 280, 60);

        jPanel4.add(Boton_Registrar);
        Boton_Registrar.setBounds(330, 380, 280, 60);

        jSeparator1.setBackground(new java.awt.Color(0, 0, 0));
        jSeparator1.setForeground(new java.awt.Color(0, 0, 0));
        jSeparator1.setOrientation(javax.swing.SwingConstants.VERTICAL);
        jSeparator1.setBorder(javax.swing.BorderFactory.createLineBorder(new java.awt.Color(0, 0, 0)));
        jPanel4.add(jSeparator1);
        jSeparator1.setBounds(468, 0, 2, 340);

        A3.setFont(new java.awt.Font("Arial", 0, 18)); // NOI18N
        A3.setForeground(new java.awt.Color(255, 0, 51));
        A3.setText("*");
        jPanel4.add(A3);
        A3.setBounds(215, 110, 10, 15);

        A1.setFont(new java.awt.Font("Arial", 0, 18)); // NOI18N
        A1.setForeground(new java.awt.Color(255, 0, 51));
        A1.setText("*");
        jPanel4.add(A1);
        A1.setBounds(440, 10, 10, 15);

        A2.setFont(new java.awt.Font("Arial", 0, 18)); // NOI18N
        A2.setForeground(new java.awt.Color(255, 0, 51));
        A2.setText("*");
        jPanel4.add(A2);
        A2.setBounds(440, 60, 10, 15);

        A8.setFont(new java.awt.Font("Arial", 0, 18)); // NOI18N
        A8.setForeground(new java.awt.Color(255, 0, 51));
        A8.setText("*");
        jPanel4.add(A8);
        A8.setBounds(925, 10, 10, 15);

        A4.setFont(new java.awt.Font("Arial", 0, 18)); // NOI18N
        A4.setForeground(new java.awt.Color(255, 0, 51));
        A4.setText("*");
        jPanel4.add(A4);
        A4.setBounds(440, 110, 10, 15);

        A5.setFont(new java.awt.Font("Arial", 0, 18)); // NOI18N
        A5.setForeground(new java.awt.Color(255, 0, 51));
        A5.setText("*");
        jPanel4.add(A5);
        A5.setBounds(440, 160, 10, 15);

        A6.setFont(new java.awt.Font("Arial", 0, 18)); // NOI18N
        A6.setForeground(new java.awt.Color(255, 0, 51));
        A6.setText("*");
        jPanel4.add(A6);
        A6.setBounds(440, 210, 10, 15);

        A7.setFont(new java.awt.Font("Arial", 0, 18)); // NOI18N
        A7.setForeground(new java.awt.Color(255, 0, 51));
        A7.setText("*");
        jPanel4.add(A7);
        A7.setBounds(440, 260, 10, 15);

        A9.setFont(new java.awt.Font("Arial", 0, 18)); // NOI18N
        A9.setForeground(new java.awt.Color(255, 0, 51));
        A9.setText("*");
        jPanel4.add(A9);
        A9.setBounds(925, 60, 10, 15);

        A10.setFont(new java.awt.Font("Arial", 0, 18)); // NOI18N
        A10.setForeground(new java.awt.Color(255, 0, 51));
        A10.setText("*");
        jPanel4.add(A10);
        A10.setBounds(925, 110, 10, 15);

        A11.setFont(new java.awt.Font("Arial", 0, 16)); // NOI18N
        A11.setForeground(new java.awt.Color(255, 0, 51));
        A11.setHorizontalAlignment(javax.swing.SwingConstants.CENTER);
        A11.setText("Las casillas marcadas con un * son obligatorias.");
        jPanel4.add(A11);
        A11.setBounds(0, 445, 940, 19);

        NombreEntry.setBackground(new java.awt.Color(255, 255, 255));
        NombreEntry.setFont(new java.awt.Font("Arial", 0, 16)); // NOI18N
        NombreEntry.setBorder(javax.swing.BorderFactory.createLineBorder(new java.awt.Color(0, 0, 0)));
        NombreEntry.setFocusCycleRoot(true);
        NombreEntry.setNextFocusableComponent(ApellidoEntry);
        NombreEntry.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                NombreEntryActionPerformed(evt);
            }
        });
        jPanel4.add(NombreEntry);
        NombreEntry.setBounds(95, 20, 340, 25);

        jLabel8.setFont(new java.awt.Font("Arial", 0, 16)); // NOI18N
        jLabel8.setForeground(new java.awt.Color(0, 0, 0));
        jLabel8.setText("Nombres:");
        jPanel4.add(jLabel8);
        jLabel8.setBounds(20, 20, 160, 25);

        jLabel9.setFont(new java.awt.Font("Arial", 0, 16)); // NOI18N
        jLabel9.setForeground(new java.awt.Color(0, 0, 0));
        jLabel9.setText("Apellidos:");
        jPanel4.add(jLabel9);
        jLabel9.setBounds(20, 70, 150, 25);

        ApellidoEntry.setBackground(new java.awt.Color(255, 255, 255));
        ApellidoEntry.setFont(new java.awt.Font("Arial", 0, 16)); // NOI18N
        ApellidoEntry.setBorder(javax.swing.BorderFactory.createLineBorder(new java.awt.Color(0, 0, 0)));
        ApellidoEntry.setNextFocusableComponent(IDCombo);
        jPanel4.add(ApellidoEntry);
        ApellidoEntry.setBounds(95, 70, 340, 25);

        jLabel10.setFont(new java.awt.Font("Arial", 0, 16)); // NOI18N
        jLabel10.setForeground(new java.awt.Color(0, 0, 0));
        jLabel10.setText("Tipo ID:");
        jPanel4.add(jLabel10);
        jLabel10.setBounds(20, 120, 60, 25);

        IDCombo.setBackground(new java.awt.Color(255, 255, 255));
        IDCombo.setFont(new java.awt.Font("Arial", 0, 16)); // NOI18N
        IDCombo.setForeground(new java.awt.Color(0, 0, 0));
        IDCombo.setModel(new javax.swing.DefaultComboBoxModel<>(new String[] { " ", "C.C.", "T.I.", "C.E."}));
        IDCombo.setNextFocusableComponent(IDEntry);
        IDCombo.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                IDComboActionPerformed(evt);
            }
        });
        jPanel4.add(IDCombo);
        IDCombo.setBounds(95, 120, 120, 25);

        jLabel17.setFont(new java.awt.Font("Arial", 0, 16)); // NOI18N
        jLabel17.setForeground(new java.awt.Color(0, 0, 0));
        jLabel17.setText("Lugar de Expedición:");
        jPanel4.add(jLabel17);
        jLabel17.setBounds(20, 170, 170, 25);

        LugarCombo.setBackground(new java.awt.Color(255, 255, 255));
        LugarCombo.setFont(new java.awt.Font("Arial", 0, 16)); // NOI18N
        LugarCombo.setForeground(new java.awt.Color(0, 0, 0));
        LugarCombo.setModel(new javax.swing.DefaultComboBoxModel<>(new String[] { " " ,"Bogota", "Tunja", "Sogamoso"}));
        LugarCombo.setNextFocusableComponent(TelefonoEntry);
        jPanel4.add(LugarCombo);
        LugarCombo.setBounds(180, 170, 255, 25);

        IDEntry.setBackground(new java.awt.Color(255, 255, 255));
        IDEntry.setFont(new java.awt.Font("Arial", 0, 16)); // NOI18N
        IDEntry.setBorder(javax.swing.BorderFactory.createLineBorder(new java.awt.Color(0, 0, 0)));
        IDEntry.setNextFocusableComponent(LugarCombo);
        IDEntry.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                IDEntryActionPerformed(evt);
            }
        });
        jPanel4.add(IDEntry);
        IDEntry.setBounds(285, 120, 150, 25);

        TelefonoEntry.setBackground(new java.awt.Color(255, 255, 255));
        TelefonoEntry.setFont(new java.awt.Font("Arial", 0, 16)); // NOI18N
        TelefonoEntry.setBorder(javax.swing.BorderFactory.createLineBorder(new java.awt.Color(0, 0, 0)));
        TelefonoEntry.setNextFocusableComponent(CorreoEntry);
        TelefonoEntry.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                TelefonoEntryActionPerformed(evt);
            }
        });
        jPanel4.add(TelefonoEntry);
        TelefonoEntry.setBounds(95, 220, 340, 25);

        jLabel7.setFont(new java.awt.Font("Arial", 0, 16)); // NOI18N
        jLabel7.setForeground(new java.awt.Color(0, 0, 0));
        jLabel7.setText("No. ID:");
        jPanel4.add(jLabel7);
        jLabel7.setBounds(230, 120, 70, 25);

        jLabel20.setFont(new java.awt.Font("Arial", 0, 16)); // NOI18N
        jLabel20.setForeground(new java.awt.Color(0, 0, 0));
        jLabel20.setText("Teléfono:");
        jPanel4.add(jLabel20);
        jLabel20.setBounds(20, 220, 70, 25);

        jLabel14.setFont(new java.awt.Font("Arial", 0, 16)); // NOI18N
        jLabel14.setForeground(new java.awt.Color(0, 0, 0));
        jLabel14.setText("Correo Institucional:");
        jPanel4.add(jLabel14);
        jLabel14.setBounds(20, 270, 150, 25);

        CorreoEntry.setBackground(new java.awt.Color(255, 255, 255));
        CorreoEntry.setFont(new java.awt.Font("Arial", 0, 16)); // NOI18N
        CorreoEntry.setBorder(javax.swing.BorderFactory.createLineBorder(new java.awt.Color(0, 0, 0)));
        CorreoEntry.setNextFocusableComponent(SedeCombo);
        jPanel4.add(CorreoEntry);
        CorreoEntry.setBounds(165, 270, 270, 25);

        SedeCombo.setBackground(new java.awt.Color(255, 255, 255));
        SedeCombo.setFont(new java.awt.Font("Arial", 0, 16)); // NOI18N
        SedeCombo.setForeground(new java.awt.Color(0, 0, 0));
        SedeCombo.setModel(new javax.swing.DefaultComboBoxModel<>(new String[] { " ","Bogota", "Medellin", "Orinoquia", "Palmira","Manizales","Tumaco" }));
        SedeCombo.setNextFocusableComponent(FacultadCombo);
        SedeCombo.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                SedeComboActionPerformed(evt);
            }
        });
        jPanel4.add(SedeCombo);
        SedeCombo.setBounds(580, 20, 340, 25);

        jLabel13.setFont(new java.awt.Font("Arial", 0, 16)); // NOI18N
        jLabel13.setForeground(new java.awt.Color(0, 0, 0));
        jLabel13.setText("Sede:");
        jPanel4.add(jLabel13);
        jLabel13.setBounds(500, 20, 50, 25);

        jLabel12.setFont(new java.awt.Font("Arial", 0, 16)); // NOI18N
        jLabel12.setForeground(new java.awt.Color(0, 0, 0));
        jLabel12.setText("Facultad:");
        jPanel4.add(jLabel12);
        jLabel12.setBounds(500, 70, 70, 25);

        FacultadCombo.setBackground(new java.awt.Color(255, 255, 255));
        FacultadCombo.setFont(new java.awt.Font("Arial", 0, 16)); // NOI18N
        FacultadCombo.setForeground(new java.awt.Color(0, 0, 0));
        FacultadCombo.setModel(new javax.swing.DefaultComboBoxModel<>(new String[] { " " ,"Facultad de Ciencias Agrarias", "Facultad Artes", "Facultad de Ciencias", "Facultad de Enfermeria", "Facultad de Ciencias Humanas", "Facultad de Derecho", "Facultad de Ingenieria", "Facultad de Medicina", "Facultad de Odontologia", "Facultad de Medicina Veterinaria y Zootecnia", "Facultad de Ciencias Economicas", "Facultad de Arquitectura", "Facultad de Minas" }));
        FacultadCombo.setNextFocusableComponent(DepartamentoCombo);
        FacultadCombo.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                FacultadComboActionPerformed(evt);
            }
        });
        jPanel4.add(FacultadCombo);
        FacultadCombo.setBounds(580, 70, 340, 25);

        jLabel16.setFont(new java.awt.Font("Arial", 0, 16)); // NOI18N
        jLabel16.setForeground(new java.awt.Color(0, 0, 0));
        jLabel16.setText("Departamento:");
        jPanel4.add(jLabel16);
        jLabel16.setBounds(500, 120, 190, 25);

        DepartamentoCombo.setBackground(new java.awt.Color(255, 255, 255));
        DepartamentoCombo.setFont(new java.awt.Font("Arial", 0, 16)); // NOI18N
        DepartamentoCombo.setForeground(new java.awt.Color(0, 0, 0));
        DepartamentoCombo.setModel(new javax.swing.DefaultComboBoxModel<>(new String[] {" " ,"Ingeniería Civil y Agrícola", "Ingeniería de Sistemas e Industrial"}));
        DepartamentoCombo.setNextFocusableComponent(jLabel21);
        DepartamentoCombo.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                DepartamentoComboActionPerformed(evt);
            }
        });
        jPanel4.add(DepartamentoCombo);
        DepartamentoCombo.setBounds(610, 120, 310, 25);

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(this);
        this.setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jPanel4, javax.swing.GroupLayout.DEFAULT_SIZE, 940, Short.MAX_VALUE)
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
                .addGap(0, 0, Short.MAX_VALUE)
                .addComponent(jPanel4, javax.swing.GroupLayout.PREFERRED_SIZE, 490, javax.swing.GroupLayout.PREFERRED_SIZE))
        );
    }// </editor-fold>//GEN-END:initComponents

    private void NombreEntryActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_NombreEntryActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_NombreEntryActionPerformed

    private void IDComboActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_IDComboActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_IDComboActionPerformed

    private void IDEntryActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_IDEntryActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_IDEntryActionPerformed

    private void TelefonoEntryActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_TelefonoEntryActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_TelefonoEntryActionPerformed

    private void SedeComboActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_SedeComboActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_SedeComboActionPerformed

    private void FacultadComboActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_FacultadComboActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_FacultadComboActionPerformed

    private void DepartamentoComboActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_DepartamentoComboActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_DepartamentoComboActionPerformed

    public void Registrar(){
        A1.setVisible(false);
        A2.setVisible(false);
        A3.setVisible(false);
        A4.setVisible(false);
        A5.setVisible(false);
        A6.setVisible(false);
        A7.setVisible(false);
        A8.setVisible(false);
        A9.setVisible(false);
        A10.setVisible(false);
        A11.setVisible(false);
        int contador = 0;
        if ("".equals(NombreEntry.getText()))
        {
            contador += 1;
            A1.setVisible(true);
        }
        if ("".equals(ApellidoEntry.getText()))
        {
            contador += 1;
            A2.setVisible(true);
        }
        if (" ".equals(IDCombo.getSelectedItem().toString()))
        {
            contador += 1;
            A3.setVisible(true);
        }
        if ("".equals(IDEntry.getText()))
        {
            contador += 1;
            A4.setVisible(true);
        }
        if (" ".equals(LugarCombo.getSelectedItem().toString()))
        {
            contador += 1;
            A5.setVisible(true);
        }
        if ("".equals(TelefonoEntry.getText()))
        {
            contador += 1;
            A6.setVisible(true);
        }
        if ("".equals(CorreoEntry.getText()))
        {
            contador += 1;
            A7.setVisible(true);
        }
        if (" ".equals(SedeCombo.getSelectedItem().toString()))
        {
            contador += 1;
            A8.setVisible(true);
        }
        if (" ".equals(FacultadCombo.getSelectedItem().toString()))
        {
            contador += 1;
            A9.setVisible(true);
        }
        if (" ".equals(DepartamentoCombo.getSelectedItem().toString()))
        {
            contador += 1;
            A10.setVisible(true);
        }
        if (contador > 0){
            A11.setVisible(true);
        }
        else{
            if ("C.C.".equals(IDCombo.getSelectedItem().toString())){
                String resultado = Docentes.Register(IDEntry.getText(), "Cedula de ciudadania", LugarCombo.getSelectedItem().toString(), 
                        NombreEntry.getText(), ApellidoEntry.getText(), CorreoEntry.getText(), TelefonoEntry.getText(),
                        DepartamentoCombo.getSelectedItem().toString());
            
                if ("Error".equals(resultado)){
                    JOptionPane.showMessageDialog(this, "Revise el registro.", "Registro Fallido", JOptionPane.ERROR_MESSAGE);
                }
                
                else if ("Registro Exitoso".equals(resultado)){
                    JOptionPane.showMessageDialog(this, "Se ha hecho el registro de forma exitosa.", "Registro Exitoso.", JOptionPane.INFORMATION_MESSAGE);  
                    this.setVisible(false);
                }
                
                else if ("Ya Registrado".equals(resultado)){
                    JOptionPane.showMessageDialog(this, "Ya existe un usuario registrado con esa ID.", "Registro Fallido", JOptionPane.ERROR_MESSAGE);
                }
            
                else{
                    JOptionPane.showMessageDialog(this, resultado, "Registro Fallido", JOptionPane.ERROR_MESSAGE);
                }
            }
        }
    }
    private void jLabel21MouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_jLabel21MouseClicked
        Registrar();
    }//GEN-LAST:event_jLabel21MouseClicked

    private void jLabel21KeyPressed(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_jLabel21KeyPressed
        if (evt.getKeyCode() == KeyEvent.VK_ENTER){
            Registrar();
        }
    }//GEN-LAST:event_jLabel21KeyPressed

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JLabel A1;
    private javax.swing.JLabel A10;
    private javax.swing.JLabel A11;
    private javax.swing.JLabel A2;
    private javax.swing.JLabel A3;
    private javax.swing.JLabel A4;
    private javax.swing.JLabel A5;
    private javax.swing.JLabel A6;
    private javax.swing.JLabel A7;
    private javax.swing.JLabel A8;
    private javax.swing.JLabel A9;
    private javax.swing.JTextField ApellidoEntry;
    private javax.swing.JPanel Boton_Registrar;
    private javax.swing.JTextField CorreoEntry;
    private javax.swing.JComboBox<String> DepartamentoCombo;
    private javax.swing.JComboBox<String> FacultadCombo;
    private javax.swing.JComboBox<String> IDCombo;
    private javax.swing.JTextField IDEntry;
    private javax.swing.JComboBox<String> LugarCombo;
    private javax.swing.JTextField NombreEntry;
    private javax.swing.JComboBox<String> SedeCombo;
    private javax.swing.JTextField TelefonoEntry;
    private javax.swing.JLabel jLabel10;
    private javax.swing.JLabel jLabel12;
    private javax.swing.JLabel jLabel13;
    private javax.swing.JLabel jLabel14;
    private javax.swing.JLabel jLabel16;
    private javax.swing.JLabel jLabel17;
    private javax.swing.JLabel jLabel20;
    private javax.swing.JLabel jLabel21;
    private javax.swing.JLabel jLabel7;
    private javax.swing.JLabel jLabel8;
    private javax.swing.JLabel jLabel9;
    private javax.swing.JPanel jPanel4;
    private javax.swing.JSeparator jSeparator1;
    // End of variables declaration//GEN-END:variables
}
