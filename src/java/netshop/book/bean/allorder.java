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
public class allorder implements Serializable {

    public static final String PROP_SAMPLE_PROPERTY = "sampleProperty";

    private String sampleProperty;

    private PropertyChangeSupport propertySupport;
    private long Id;			//ID序列号
    private long orderId;			//订单号表序列号
    private long BookNo;			//图书表序列号
    private int Amount;			//订货数量

    public allorder() {
        Id = 0;
        orderId = 0;
        BookNo = 0;
        Amount = 0;
    }

    public long getId() {
        return Id;
    }

    public void setId(long newId) {
        this.Id = newId;
    }

    public long getOrderId() {
        return orderId;
    }

    public void setOrderId(long orderId) {
        this.orderId = orderId;
    }

    public long getBookNo() {
        return BookNo;
    }

    public void setBookNo(long newBookNo) {
        this.BookNo = newBookNo;
    }

    public int getAmount() {
        return Amount;
    }

    public void setAmount(int newAmount) {
        this.Amount = newAmount;
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
