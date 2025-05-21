<script setup>
import { LottieAnimation } from 'lottie-web-vue';
import { ref } from 'vue';
import animationData from '../assets/lottie_animation.json';

defineProps({
  msg: String,
});

const count = ref(0);
</script>

<template>
  <div>
    <h1>{{ msg }}</h1>
    <div class="lottie-container">
      <LottieAnimation
        :animation-data="animationData"
        :loop="true"
        :auto-play="true"
        :speed="1"
      />
    </div>
    <div class="card">
      <button type="button" @click="count++">count is {{ count }}</button>
    </div>
  </div>
</template>

<style scoped>
.lottie-container {
  width: 300px;
  height: 300px;
  margin: 0 auto;
}

.read-the-docs {
  color: #888;
}
</style>
