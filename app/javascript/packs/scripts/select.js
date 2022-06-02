class priceUpdater {
    // This executes when the function is instantiated.
    constructor() {
        this.links = document.querySelectorAll("select[name*='\[product_id\]']")
        this.iterateLinks()
    }

    iterateLinks() {
        // If there are no links on the page, stop the function from executing.
        if (this.links.length === 0) return
        // Loop over each link on the page.
        this.links.forEach(link => {
            link.addEventListener('change', e => {
                this.handleChange(link, e)
            })
        })
    }

    handleChange(link, e) {
        const productId = link.value
        const priceId = link.id.slice(0, -10) + 'price'
        const priceElem = document.querySelector(`#${priceId}`)
        if (productId === 0) {
            priceElem.value = 0
            return
        }
        const url = `/products/${productId}.json`

        fetch(url)
            .then(response => response.json())
            .then(json => {
                priceElem.value = Number(json.price)
            }).catch(priceElem.value = 0)
    }
}
// Wait for turbolinks to load, otherwise `document.querySelectorAll()` won't work
window.addEventListener('turbolinks:load', () => new priceUpdater())

export default priceUpdater