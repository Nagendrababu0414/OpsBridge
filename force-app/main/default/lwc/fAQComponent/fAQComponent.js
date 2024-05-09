import { LightningElement, wire } from 'lwc';
import getFAQs from '@salesforce/apex/FAQController.getFAQs';

export default class FAQComponent extends LightningElement {
    faqs = [];

    @wire(getFAQs)
    wiredFAQs({ error, data }) {
        if (data) {
            this.faqs = data.map(faq => ({ ...faq, isExpanded: false }));
        } else if (error) {
            console.error('Error loading FAQs', error);
        }
    }

    handleClick(event) {
        const faqId = event.currentTarget.key;
        const updatedFAQs = this.faqs.map(faq => ({
            ...faq,
            isExpanded: faq.Id === faqId ? !faq.isExpanded : false
        }));
        this.faqs = updatedFAQs;
    }
}