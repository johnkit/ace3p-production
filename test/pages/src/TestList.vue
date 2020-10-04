<template>
    <div>
        <div v-for="(test, index) in tests" :key="index">
            <a :href="test" @click.prevent="select(`${index}`)">{{test}}</a>
        </div>
    </div>
</template>

<script>
module.exports = {
    props: {
        tests: {
            type: Array,
            default: function() {return ['from prop']}
        }
    },
    data: function() {
        return {
            // tests: [ 'example', 'setup', '01-omega3p-test1'],
        }
    },  // data
    methods: {
        select: function(i) {
            let test = this.tests[i];
            // console.log(`emitting test ${test}`);
            this.$emit('selected', test)
        }
    },  // methods
}
</script>

<style scoped>
</style>
