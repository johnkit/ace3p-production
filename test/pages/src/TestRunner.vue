<template>
    <div>
        <div v-if="sequence">
            <h4>{{sequence.name}}</h4>
            <div v-for="(step,index) in sequence.steps" :key="index">
                <div v-show="index == stepNumber">
                    <p>{{index + 1}}. {{step.title}}</p>
                    <p>{{step.action}}</p>
                    <p v-if="step.expect">Expect: {{step.expect}}</p>
                </div>
            </div>
            <div>
                <button :disabled="isNextDisabled" @click="stepNumber++">Next</button>
                {{isNextDisabled}}
                <br />
                <button :disabled="stepNumber == 0" @click="stepNumber--">Back</button>
                {{stepNumber}}, {{stepNumber == 0}}
            </div>
        </div>
    </div>
</template>

<script>
module.exports = {
    props: ['test'],
    data: function() {
        return {
            sequence: null,
            stepNumber: 0,
        }
    },  // data
    methods: {
        startTest: function() {
            // console.log(`TestRunner updating test ${this.test}`);
            let ts = Date.now();
            let filename = `../tests/${this.test}.json?${ts}`;
            axios.get(filename)
                .then(response => {
                    this.sequence = response.data;
                    this.stepNumber = 0;
                })
                .catch(function(error) {console.error(error)});
        },  // startTest()
    },  // methods
    computed: {
        isNextDisabled: function() {
            let last = this.sequence.steps.length - 1;
            return this.stepNumber === last;
        }
    },  // computed
    mounted() {
        this.startTest();
    },  // mounted()
    watch: {
        test: function(newVal, oldVal) {
            // console.log(`TestRunner: test changed to ${newVal}`);
            this.startTest();
        }
    },  // watch
}
</script>

<style scoped>
</style>
