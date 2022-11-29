/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/GUIForms/JPanel.java to edit this template
 */
package proyecto.serviciopasantias.Vista.Menu_Comite;

import java.awt.Component;
import java.awt.Font;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import javax.swing.table.DefaultTableModel;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;
import java.sql.ResultSetMetaData;
import javax.swing.DefaultCellEditor;
import javax.swing.JButton;
import javax.swing.JTable;
import javax.swing.JTextField;
import javax.swing.table.JTableHeader;
import javax.swing.table.TableCellRenderer;
import proyecto.serviciopasantias.Modelo.Actividad;
import proyecto.serviciopasantias.Modelo.Docentes;
import proyecto.serviciopasantias.Modelo.Empresas;
import proyecto.serviciopasantias.Modelo.Estudiantes;
import proyecto.serviciopasantias.Modelo.Validar;
import proyecto.serviciopasantias.Vista.Menu_Estudiante.RegistrarPasantía;

/**
 *
 * @author snsc2
 */
public class UsuariosSinRegistrar extends javax.swing.JPanel {

    /**
     * Creates new form UsuariosSinRegistrar
     * @throws java.sql.SQLException
     */
    public UsuariosSinRegistrar() throws SQLException {
        initComponents();
        ResultSet rs = Validar.GetInfo();
        if (rs == null){
            jTable1.removeAll();
            jTable1.setFont(new Font("Tw Cen Mt", Font.PLAIN, 16));
        }
        else{
            jTable1.setModel(buildTableModel(Validar.GetInfo()));
            jTable1.setFont(new Font("Tw Cen Mt", Font.PLAIN, 16));
            jTable1.getColumnModel().getColumn(4).setCellRenderer(new ButtonRenderer());
            jTable1.getColumnModel().getColumn(4).setCellEditor(new ButtonEditor(new JTextField()));
        }
        JTableHeader tableHeader = jTable1.getTableHeader();
        Font headerFont = new Font("Tw Cen Mt", Font.BOLD, 18);
        tableHeader.setFont(headerFont);
        
    }
    
    public void Hide(){
        this.setVisible(false);
    }
    
    class ButtonRenderer extends JButton implements  TableCellRenderer
    {
        //CONSTRUCTOR
        public ButtonRenderer() {
            //SET BUTTON PROPERTIES
            setOpaque(true);
        }
        @Override
        public Component getTableCellRendererComponent(JTable table, Object obj,
            boolean selected, boolean focused, int row, int col) {

            //SET PASSED OBJECT AS BUTTON TEXT
            setText((obj==null) ? "":obj.toString());
            return this;
        }
    }
    
    //BUTTON EDITOR CLASS
    class ButtonEditor extends DefaultCellEditor
    {
        protected JButton btn;
        private String lbl;
        private Boolean clicked;

        public ButtonEditor(JTextField txt) {
            super(txt);

            btn=new JButton();
            btn.setOpaque(true);

            //WHEN BUTTON IS CLICKED
            btn.addActionListener(new ActionListener() {
                @Override
                public void actionPerformed(ActionEvent e) {
                    fireEditingStopped();
                }
            });
        }

        //OVERRIDE A COUPLE OF METHODS
        @Override
        public Component getTableCellEditorComponent(JTable table, Object obj,
        boolean selected, int row, int col) {
            //SET TEXT TO BUTTON,SET CLICKED TO TRUE,THEN RETURN THE BTN OBJECT
            lbl=(obj==null) ? "":obj.toString();
            btn.setText(lbl);
            clicked=true;
            return btn;
        }

        //IF BUTTON CELL VALUE CHNAGES,IF CLICKED THAT IS
        @Override
        public Object getCellEditorValue() {
            if(clicked){
                
                //SHOW US SOME MESSAGE
                int row = jTable1.getSelectedRow();
                String id = jTable1.getModel().getValueAt(row, 2).toString();
                String ocupacion = jTable1.getModel().getValueAt(row, 3).toString();
                if ("Estudiante".equals(ocupacion)){
                    Estudiantes.GetInfoValidar(id);
                    ValidarEstudiante b = new ValidarEstudiante();
                    b.setVisible(true);
                }
                else if ("Empresario".equals(ocupacion)){
                    Empresas.GetInfoValidar(id);
                    ValidarEmpresas b = new ValidarEmpresas();
                    b.setVisible(true);
                }
                else if ("Docente".equals(ocupacion)){
                    Docentes.GetInfoValidar(id);
                    ValidarDocentes b = new ValidarDocentes();
                    b.setVisible(true);
                }
            }
            //SET IT TO FALSE NOW THAT ITS CLICKED
            clicked=false;
            return new String(lbl);
        }

        @Override
        public boolean stopCellEditing() {
            //SET CLICKED TO FALSE FIRST
            clicked=false;
            return super.stopCellEditing();
        }

        @Override
        protected void fireEditingStopped() {
            // TODO Auto-generated method stub
            super.fireEditingStopped();
        }
    }
    
    public static DefaultTableModel buildTableModel(ResultSet rs) throws SQLException{
        Vector<String> columnNames = new Vector<String>();
        columnNames.add("Nombre");
        columnNames.add("Apellido");
        columnNames.add("No. ID");
        columnNames.add("Ocupación");
        columnNames.add("Validar");
        
        Vector<Vector<Object>> data = new Vector<Vector<Object>>();
        
        ResultSetMetaData metaData = rs.getMetaData();
        int columnCount = metaData.getColumnCount();
        rs.beforeFirst();
        while (rs.next()) {
            Vector<Object> vector = new Vector<Object>();
            for (int columnIndex = 1; columnIndex <= columnCount+2; columnIndex++) {
                String id = rs.getString(3);
                if (columnIndex == 4){
                    if ("Estudiante".equals(Validar.GetRol(id))){
                        vector.add("Estudiante");
                    }
                    else if ("Docente".equals(Validar.GetRol(id))){
                        vector.add("Docente");
                    }
                    else if ("Responsable".equals(Validar.GetRol(id))){
                        vector.add("Empresario");
                    }
                }
                else if (columnIndex == 5){
                    vector.add("Validar");
                }
                else{
                    vector.add(rs.getObject(columnIndex));                    
                }
                
            }
            data.add(vector);
        }
        
        return new DefaultTableModel(data, columnNames);
    }

    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jScrollPane1 = new javax.swing.JScrollPane();
        jTable1 = new javax.swing.JTable();

        setBackground(new java.awt.Color(255, 255, 255));
        setLayout(null);

        jTable1.setFont(new java.awt.Font("Tw Cen MT", 0, 18)); // NOI18N
        jTable1.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {
                {null, null, null, null, null},
                {null, null, null, null, null},
                {null, null, null, null, null},
                {null, null, null, null, null}
            },
            new String [] {
                "Nombre", "Apellido", "No. ID.", "Ocupación", "Validar"
            }
        ) {
            boolean[] canEdit = new boolean [] {
                false, false, false, false, false
            };

            public boolean isCellEditable(int rowIndex, int columnIndex) {
                return canEdit [columnIndex];
            }
        });
        jTable1.setRowHeight(30);
        jTable1.setRowMargin(0);
        jTable1.setShowGrid(true);
        jScrollPane1.setViewportView(jTable1);

        add(jScrollPane1);
        jScrollPane1.setBounds(0, 0, 1150, 470);
    }// </editor-fold>//GEN-END:initComponents


    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JTable jTable1;
    // End of variables declaration//GEN-END:variables
}
