/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/GUIForms/JPanel.java to edit this template
 */
package proyecto.serviciopasantias.Vista.Menu_Profesor;


import java.awt.BorderLayout;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.swing.JOptionPane;
import javax.swing.table.DefaultTableModel;
import proyecto.serviciopasantias.Modelo.Conexion;
import proyecto.serviciopasantias.Modelo.Docentes;

/**
 *
 * @author Windows
 */
public class PasantiasDisponiblesProfesor extends javax.swing.JPanel {
    
    public static String Id="";

    /**
     * Creates new form InformacionPersonal
     */
    public PasantiasDisponiblesProfesor() {
        initComponents();
        mostrar();
    }

    public void mostrar()
    {
        
        String []  nombresColumnas = {"Estudiante","Pasantia","Empresa"};
        String [] registros = new String[3];

        
        DefaultTableModel modelo = new DefaultTableModel(null,nombresColumnas){
            
            @Override
            public boolean isCellEditable(int row, int column){
                return false;
            };
            
            
            
        };
        
        

        Connection cn = null;
        
        PreparedStatement pst= null;

        ResultSet rs=null;

        

        
        
        try
        {
            cn = Conexion.conectar();

           
            pst = cn.prepareStatement("SELECT pasantia.ID, persona.NOMBRE, pasantia.TITULO, empresa.NOMBRE FROM pasantia INNER JOIN estudiante ON pasantia.ESTUDIANTE = estudiante.ID INNER JOIN persona ON estudiante.PERSONA_ID = persona.ID INNER JOIN responsable ON pasantia.RESPONSABLE = responsable.ID INNER JOIN empresa ON responsable.EMPRESA = empresa.ID INNER JOIN usuario ON persona.ID = usuario.PERSONA INNER JOIN docente ON pasantia.DOCENTE_DIRECTOR = docente.ID WHERE docente.PERSONA_ID = '"+ Docentes.no_id  +"'");
            
            rs = pst.executeQuery();
            


         

            while(rs.next())
            {
                registros[0] = rs.getString(2);
                registros[1] =  rs.getString(3);
                registros[2] = rs.getString(4);
                modelo.addRow(registros);
             
                
            }
            
            visor1.setModel(modelo);
            
            
            

            
            

           
        }
        catch(SQLException e)
        {
            
            JOptionPane.showMessageDialog(null,"Error al conectar");
            
        }
        finally
        {
            try
            {
                if (pst != null) pst.close();
                if (rs != null) rs.close();
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

        TablaContenido = new javax.swing.JPanel();
        jScrollPane1 = new javax.swing.JScrollPane();
        visor1 = new javax.swing.JTable();
        jPanel2 = new javax.swing.JPanel();
        Boton_Editar = new javax.swing.JLabel();

        setPreferredSize(new java.awt.Dimension(1150, 420));

        TablaContenido.setLayout(null);

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
        visor1.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                visor1MouseClicked(evt);
            }
            public void mousePressed(java.awt.event.MouseEvent evt) {
                visor1MousePressed(evt);
            }
        });
        jScrollPane1.setViewportView(visor1);

        TablaContenido.add(jScrollPane1);
        jScrollPane1.setBounds(30, 20, 1100, 310);

        jPanel2.setBackground(new java.awt.Color(148, 180, 59));
        jPanel2.setLayout(null);

        Boton_Editar.setFont(new java.awt.Font("Tw Cen MT", 0, 24)); // NOI18N
        Boton_Editar.setHorizontalAlignment(javax.swing.SwingConstants.CENTER);
        Boton_Editar.setText("Calificar");
        Boton_Editar.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                Boton_EditarMouseClicked(evt);
            }
        });
        jPanel2.add(Boton_Editar);
        Boton_Editar.setBounds(0, 0, 140, 60);

        TablaContenido.add(jPanel2);
        jPanel2.setBounds(480, 340, 140, 60);

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(this);
        this.setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(TablaContenido, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(TablaContenido, javax.swing.GroupLayout.Alignment.TRAILING, javax.swing.GroupLayout.DEFAULT_SIZE, 420, Short.MAX_VALUE)
        );
    }// </editor-fold>//GEN-END:initComponents

    private void visor1MouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_visor1MouseClicked
        int seleccionar = visor1.rowAtPoint(evt.getPoint());
        Id= String.valueOf(visor1.getValueAt(seleccionar,0));
        
    }//GEN-LAST:event_visor1MouseClicked

    private void visor1MousePressed(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_visor1MousePressed
        // TODO add your handling code here:
    }//GEN-LAST:event_visor1MousePressed

    private void Boton_EditarMouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_Boton_EditarMouseClicked
        // TODO add your handling code here:
        InformacionPasantiaProfesor p1 = new InformacionPasantiaProfesor();
        p1.setSize(1150,420);
        p1.setLocation(0,0);
        
        TablaContenido.removeAll();
        TablaContenido.add(p1,BorderLayout.CENTER);
        TablaContenido.revalidate();
        TablaContenido.repaint();
        
    }//GEN-LAST:event_Boton_EditarMouseClicked

    

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JLabel Boton_Editar;
    private javax.swing.JPanel TablaContenido;
    private javax.swing.JPanel jPanel2;
    private javax.swing.JScrollPane jScrollPane1;
    public javax.swing.JTable visor1;
    // End of variables declaration//GEN-END:variables
}
