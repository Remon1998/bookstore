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
public class shopcart implements Serializable {

    public static final String PROP_SAMPLE_PROPERTY = "sampleProperty";

    private String sampleProperty;

    private PropertyChangeSupport propertySupport;

    private long bookId;		//图书ID编号
    private int quanlity;		//选购数量

    public shopcart() {
        bookId = 0;
        quanlity = 0;
    }

    public long getBookId() {
        return bookId;
    }

    public void setBookId(long newbookId) {
        bookId = newbookId;
    }

    public long getQuality() {
        return quanlity;
    }

    public void setQuanlity(int newquanlity) {
        quanlity = newquanlity;
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
