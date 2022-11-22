/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/GUIForms/JPanel.java to edit this template
 */
package proyecto.serviciopasantias.Vista.Menu_Profesor;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.swing.JOptionPane;
import javax.swing.table.DefaultTableModel;
import proyecto.serviciopasantias.Modelo.Conexion;
import proyecto.serviciopasantias.Vista.Menu_Estudiante.*;

/**
 *
 * @author Windows
 */
public class PasantiasDisponiblesProfesor extends javax.swing.JPanel {

    /**
     * Creates new form InformacionPersonal
     */
    public PasantiasDisponiblesProfesor() {
        initComponents();
        mostrar();
    }

    public void mostrar()
    {
        String []  nombresColumnas = {"","Estudiante","Pasantia","Empresa"};
        String [] registros = new String[4];
        
        DefaultTableModel modelo = new DefaultTableModel(null,nombresColumnas);
        visor1.setModel(modelo);
        
        String sql = "SELECT * FROM pasantia";
        
        Connection cn = null;
        
        PreparedStatement pst = null;
        
        ResultSet rs = null;
        
        try
        {
            cn = Conexion.conectar();
            
            pst = cn.prepareStatement(sql);                        
            
            rs = pst.executeQuery();
            
            while(rs.next())
            {
                registros[0] = rs.getString("ID");
                
                registros[0] = rs.getString("ESTUDIANTE");
                
                registros[1] = rs.getString("TITULO");
                
                registros[2] = rs.getString("RESPONSABLE");
                
   
                
                modelo.addRow(registros);
                
            }
            
           
        }
        catch(SQLException e)
        {
            
            JOptionPane.showMessageDialog(null,"Error al conectar");
            
        }
        finally
        {
            try
            {
                if (rs != null) rs.close();
                
                if (pst != null) pst.close();
                
                if (cn != null) cn.close();
            }
            catch(SQLException e)
            {
                JOptionPane.showMessageDialog(null,e);
            }
        }
    }
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jPanel1 = new javax.swing.JPanel();
        jScrollPane1 = new javax.swing.JScrollPane();
        visor1 = new javax.swing.JTable();
        jPanel2 = new javax.swing.JPanel();
        Boton_Editar = new javax.swing.JLabel();

        setPreferredSize(new java.awt.Dimension(1150, 420));

        jPanel1.setLayout(null);

        visor1.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {
                {null, null, null, null},
                {null, null, null, null},
                {null, null, null, null},
                {null, null, null, null}
            },
            new String [] {
                "Title 1", "Title 2", "Title 3", "Title 4"
            }
        ));
        jScrollPane1.setViewportView(visor1);

        jPanel1.add(jScrollPane1);
        jScrollPane1.setBounds(30, 20, 1100, 310);

        jPanel2.setBackground(new java.awt.Color(148, 180, 59));
        jPanel2.setLayout(null);

        Boton_Editar.setFont(new java.awt.Font("Tw Cen MT", 0, 24)); // NOI18N
        Boton_Editar.setHorizontalAlignment(javax.swing.SwingConstants.CENTER);
        Boton_Editar.setText("Calificar");
        jPanel2.add(Boton_Editar);
        Boton_Editar.setBounds(0, 0, 140, 60);

        jPanel1.add(jPanel2);
        jPanel2.setBounds(480, 340, 140, 60);

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(this);
        this.setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jPanel1, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jPanel1, javax.swing.GroupLayout.Alignment.TRAILING, javax.swing.GroupLayout.DEFAULT_SIZE, 420, Short.MAX_VALUE)
        );
    }// </editor-fold>//GEN-END:initComponents


    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JLabel Boton_Editar;
    private javax.swing.JPanel jPanel1;
    private javax.swing.JPanel jPanel2;
    private javax.swing.JScrollPane jScrollPane1;
    public javax.swing.JTable visor1;
    // End of variables declaration//GEN-END:variables
}
