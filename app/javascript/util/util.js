export function handleError(response) {
    if (response.status === 500) {
        alert('this email is already registered')
        throw Error(response.statusText)
    }
    return response
}