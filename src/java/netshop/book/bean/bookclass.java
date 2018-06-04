/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package netshop.book.bean;

import java.beans.*;
import java.io.Serializable;

/**
 *
 * @author 14520
 */
public class bookclass implements Serializable {

    public static final String PROP_SAMPLE_PROPERTY = "sampleProperty";

    private String sampleProperty;

    private PropertyChangeSupport propertySupport;

    private int Id;			//ID序列号
    private String ClassName;	//图书类别

    public bookclass() {
        Id = 0;
        ClassName = "";
    }

    public bookclass(int newId, String newname) {
        Id = newId;
        ClassName = newname;
    }

    public int getId() {
        return Id;
    }

    public void setId(int newId) {
        this.Id = newId;
    }

    public String getClassName() {
        return ClassName;
    }

    public void setClassName(String newname) {
        this.ClassName = newname;
    }

    public String getSampleProperty() {
        return sampleProperty;
    }

    public void setSampleProperty(String value) {
        String oldValue = sampleProperty;
        sampleProperty = value;
        propertySupport.firePropertyChange(PROP_SAMPLE_PROPERTY, oldValue, sampleProperty);
    }

    public void addPropertyChangeListener(PropertyChangeListener listener) {
        propertySupport.addPropertyChangeListener(listener);
    }

    public void removePropertyChangeListener(PropertyChangeListener listener) {
        propertySupport.removePropertyChangeListener(listener);
    }

}
